[🔥 Download App](https://github.com/escherwd/simpleCrypt/releases)

# simpleCrypt
A super simple encrypter and decrypter for plain text for macOS (10.10+)


__This is just a basic idea in code form. The "encryption" (and I use that word loosely) process goes something like this:__
* User inputs text and codeword
* codeword is made into an integer using unicode html codes
* text is translated letter for letter into their unicode codes
* each unicode letter code is multiplied by the codeword int
* since all the letters in the inputed text are all huge numbers, the largest product is found
* all the other numbers have 0's added to them for padding, I.E all the "encrypted" letters have the same character count
* the consistent character count is added to the front of the result string
* an integer saying how many digits the consistent character count is is added to the front
* the final string of numbers is produced
* that final string of numbers is converted into letters and numbers where possible using a custom 0-51 int to char system
* the final, shortened, string is displayed to user

*Reading that made no sense to me and probably didn't make sense to you but that's fine*

__The "decryption" process goes like this:__
* User inputs text and codeword
* codeword is made into an integer using html codes
* the text is divided into the encrypted letters using the consistent character count
* the letters are divided by the codeword integer to get the unicode html code
* the unicode html codes are made back into letters
* all the letters are added to make a string
* the decrypted string is returned to the user

Issues
------
There are a lot of issues with this software, and it'll probably crash frequently
This is just the first version of a project that took 2 days to make so it's not a big deal

* Sometimes the last letters of the decrypted text are wrong [don't really know why]
* Sometimes encrypted text can be decrypted with several different codewords [will fix in next version]
* If there's an error saving the output as a txt file you won't know [will add an alert in next version]
* No async loading/loading indicator; encrypting/decrypting lots of text will lock UI [will fix in next version]
* Very little (if not none) of the code has notes [will add if requested]

License
------
```MIT License

Copyright (c) 2018 Escher WD

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
