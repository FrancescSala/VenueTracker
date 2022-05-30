    class Discipline {
        constructor() {
            this.code = '';
            this.name = '';
        };
    
        setCode(code) { this.code = code; }
        getCode() { return this.code; }
        setName(name) { this.name = name; }
        getName() { return this.name; }
    }
    
    module.exports = () => { return new Discipline(); }
    