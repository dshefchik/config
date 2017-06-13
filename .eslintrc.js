module.exports = {
    "extends": "eslint:recommended",
    "parserOptions": {
       "ecmaVersion": 6
    },
    "env": {
        "browser": true,
        "node": true,
        "es6" : true
    },
    "rules": {
        // enable additional rules
        "indent": ["error", 4],
        "linebreak-style": ["error", "unix"],
        "quotes": ["error", "double"],
        "semi": ["error", "always"],

        // override default options for rules from base configurations
        "comma-dangle": ["error", "always"],
        "no-cond-assign": ["error", "always"],
        "no-console" : "off"
    }
}
