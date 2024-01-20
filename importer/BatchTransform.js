const { Transform } = require("node:stream")

module.exports = class BatchTransform extends Transform {
    _batchLength;
    _batch = new Map();
    _saveErrorsFn;
    _formatDataFn;

    _itemCounter = 0;
    _itemLinePosition = 1;

    constructor({ batchLength, saveErrorsFn, formatDataFn, opts }) {
        super(opts);
        this._batchLength = batchLength;
        this._saveErrorsFn = saveErrorsFn;
        this._formatDataFn = formatDataFn;
    }

    _transform(item, encoding, callback) {
        try {
            this._itemCounter++;
            this._itemLinePosition++;
            const formattedItem = this._formatDataFn(item)
            this._batch.set(this._itemLinePosition, formattedItem);

            if (this._itemCounter >= this._batchLength) {
                this.push(new Map(this._batch));

                this._batch.clear();
                this._itemCounter = 0;

                callback();
                return;
            }

            callback();
        } catch (e) {
            if (this._saveErrorsFn) {
                this._saveErrorsFn(this._itemLinePosition);
            }
            callback();
        }
    }

    _flush(callback) {
        if (this._batch.size > 0) {
            this.push(new Map(this._batch));
            this._batch.clear();
            callback();
            return
        }

        callback()
    }
}