<!-- markdownlint-disable MD041 -->
[//]: # (auto_md_to_doc_comments segment start A)

# pwnedpasswords_range_bash_script

**Small and simple bash script to check if your password is contained in known breaches (2025-02)**  
***version: 2025.227.1347  date: 2025-02-27 author: [bestia.dev](https://bestia.dev) repository: [GitHub](https://github.com/bestia-dev/pwnedpasswords_range_bash_script)***  

 ![maintained](https://img.shields.io/badge/maintained-green)
 ![ready_for_use](https://img.shields.io/badge/ready_for_use-green)
 ![Lines in bash scripts](https://img.shields.io/badge/Lines_in_bash_scripts-46-blue.svg)

 ![License](https://img.shields.io/badge/license-MIT-blue.svg)
 ![pwnedpasswords_range_bash_script](https://bestia.dev/webpage_hit_counter/get_svg_image/1934657624.svg)

Hashtags: #bash_script #pwnedpasswords  
My projects on GitHub are more like a tutorial than a finished product: [bestia-dev tutorials](https://github.com/bestia-dev/tutorials_rust_wasm).  

## Motivation

The breaches of many many web sites gave hackers a big database of passwords.  
They can use that for a dictionary attack that is much more efficient of a brute force attack.  
If your password is in that database it is bad. You need to change it.  
We are happy that Troy Hunt have made the Open Source database of these passwords.  
On //haveibeenpwned.com, we can discover if our password is in this database.

I don't like to type my passwords in some web site. I rather type it in a bash script.

## API call and bash script

We can use a simple API call to discover if the password is pwnd.  
First your password will be hashed locally. The first 5 characters of the hash will be sent to  
<https://api.pwnedpasswords.com/range/hash_fragment>  
This way, you are never sending anything secret around the internet. That would be a no-no.  
Read more here:  
<https://www.troyhunt.com/understanding-have-i-been-pwneds-use-of-sha-1-and-k-anonymity>  

The service will return a list of hashes that start with the fragment. This is pretty innocuous.  
If your hash is in this list, bad luck, Oh no - you are pwned!  
Change your password and don't reuse it ever again. It is a bad compromised password.  

I used the script from <https://github.com/jank/pwned> as my starting point.  
I wanted to write a Rust program, but the bash script is better for review and inspection, because we are dealing with secrets here.

## Use

I simply run the script in `Debian bash` shell or in `Windows git-bash` shell:  

```bash
sh pwnedpasswords-range.sh
```

## Open-source and free as a beer

My open-source projects are free as a beer (MIT license).  
I just love programming.  
But I need also to drink. If you find my projects and tutorials helpful, please buy me a beer by donating to my [PayPal](https://paypal.me/LucianoBestia).  
You know the price of a beer in your local bar ;-)  
So I can drink a free beer for your health :-)  
[Na zdravje!](https://translate.google.com/?hl=en&sl=sl&tl=en&text=Na%20zdravje&op=translate) [Alla salute!](https://dictionary.cambridge.org/dictionary/italian-english/alla-salute) [Prost!](https://dictionary.cambridge.org/dictionary/german-english/prost) [Nazdravlje!](https://matadornetwork.com/nights/how-to-say-cheers-in-50-languages/) 🍻

[//bestia.dev](https://bestia.dev)  
[//github.com/bestia-dev](https://github.com/bestia-dev)  
[//bestiadev.substack.com](https://bestiadev.substack.com)  
[//youtube.com/@bestia-dev-tutorials](https://youtube.com/@bestia-dev-tutorials)  

[//]: # (auto_md_to_doc_comments segment end A)
