    class Zone {
        constructor() {
            this.code = '';
            this.name = '';
            this.description = '';
        };
    
        setCode(code) { this.code = code; }
        getCode() { return this.code; }
        setName(name) { this.name = name; }
        getName() { return this.name; }
        setDescription(description) {this.description = description; }
        getDescription() { return this.description; }
    }
    
    module.exports = () => { return new Zone(); }
    