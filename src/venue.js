class Venue {
    constructor() {
        this.code = '';
        this.name = '';
        this.description = '';
        this.type = '';
        this.zone = '';
    };

    setCode(code) { this.code = code; }
    getCode() { return this.code; }
    setName(name) { this.name = name; }
    getName() { return this.name; }
    setDescription(description) {this.description = description; }
    getDescription() { return this.description; }
    setType(type) {this.type = type; }
    getType() { return this.type; }
    setZone(zone) {this.zone = zone; }
    getZone() { return this.zone; }

}

module.exports = () => { return new Venue(); }
