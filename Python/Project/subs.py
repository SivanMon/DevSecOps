import random
def make_enc_key():
    value=list("abcdefghijklmnopqrstuvwxyz")
    keys=list("abcdefghijklmnopqrstuvwxyz")
    random.shuffle(value)
    enc_key=dict(zip(keys,value))
    return(enc_key)

def compute_dec_key(enc_key):
    dec_key={}
    for original, encrypted in enc_key.items():
        dec_key[encrypted] = original
    return(dec_key)

def encrypt_text(text, enc_key):
    enc_text=""
    for char in text:
        if char in enc_key:
            enc_text += enc_key[char]
        else:
            enc_text += char
    return(enc_text)

def decrypt_text(enc_text,dec_key):
    dec_text=""
    for char in enc_text:
        if char in dec_key:
            dec_text += dec_key[char]
        else:
            dec_text += char
    return(dec_text)

def test_all(text):
    enc_key=make_enc_key()
    dec_key=compute_dec_key(enc_key)
    enc_text=encrypt_text(text, enc_key)
    dec_text=(decrypt_text(enc_text,dec_key))
    print("orginal text:", text)
    print("encrypt_text:", enc_text)
    print("decrypt text:", dec_text)
    print("enc_key:", enc_key)
    print("dec_key:", dec_key)

    if dec_text == text:
        print("decryption succesful")
        return True
    else:
        print("decryption failed")
        return False

test_all(input("Enter text dcrypet: "))

