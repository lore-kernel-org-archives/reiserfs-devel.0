From: David Masover <ninja@slaphack.com>
Subject: Re: Yet another reiserfs<dm<md corruption
Date: Tue, 12 Apr 2005 20:48:07 -0500
Message-ID: <425C7A57.1080905@slaphack.com>
References: <1113156285.4681.7.camel@localhost>	 <425ABC1C.2030001@namesys.com> <1113246505.4614.9.camel@localhost> <425C3404.1090609@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23859-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425C3404.1090609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "E.Gryaznova" <grev@namesys.com>
Cc: jzobel@heute-morgen.de, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

E.Gryaznova wrote:
> Hello.
> 
> Joachim Zobel wrote:
> 
>> Am Montag, den 11.04.2005, 22:04 +0400 schrieb E.Gryaznova:
>>
>>  
>>
>>> Would you please send the following commands outputs?:
>>> # dmsetup deps
>>> # dmsetup status
>>> # dmsetup info
>>> # pvdisplay --map
>>> # lvdisplay --map -vv
>>>
>>>
>>> # ls -l /dev/vg (and /dev/mapper)
>>>
>>>   
>>
>>
>> See the attached file reiserfs.log
>>
>> The devices volg2-logv4: 1 dependencies     : (22, 3)
>> volg2-logv3: 1 dependencies     : (22, 3)
>> volg2-logv2: 1 dependencies     : (22, 3)
>> where created after the incident. One of them had a successful (some
>> files lost) reiserfsck --rebuild-tree
>> after dd-ing the bad /dev/volg-raid1/logv1 on it.
>> lvdisplay --map -v did some stderr output, which is attached as
>> lvdisplay.err
>>
>> #cat /proc/mdstat
>> Personalities : [raid1]
>> md0 : active raid1 hda2[0] hdc2[1]
>>      3903680 blocks [2/2] [UU]
>>
>> Sincerely,
>> Joachim
>>  
>>
> 
> I have checked lvm, it looks ok. Probably this is hardware problem.
> If you need our  assistance in further investigation, please visit our
> support page http://www.namesys.com/support.html .

This just suddenly became an issue for me -- I'm about to do dm-raid.
What's a good filesystem stress-testing tool?  (I want to do Reiser4.)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQlx6V3gHNmZLgCUhAQJxjw/+PDsstdWS2VDX+bLSaBwBDxZvIMaYN8V0
IdgmjSsOcqSLNb70J3es6HJMTrAxWFJ7YjQtQ+J7xqvtYJlMDr/EafFB7nLxk9eP
6SnrXk5LAp00YLBS66s6Rxz+5YZaRNVHl5MRNu5Hz3dYe5+Jk08FgnlDMMA0wKD2
6y/qvNAYP3DdxNlSKx/bo6b+nTQZaLTh8FV2Ew5g5xdXtyb0R1xrBx06njJZwnlb
w8MMnR/Uz1b8rJwCP4fEzoZulrtgbNE+oe9GRF+uujiTD4Jb7RAXyokBTGutiO1d
ROmC8OvmjmNo9LU0c+9waUP0NMd+nOwqpM7vToTX3Vbi3B1F9v+7B4FAQRDIlvle
opVV7GhzsoRoRMHc/Dc/PENVk6FylHaWqFWCGfqRtDFnUeGyON5E221B8ppQOsFa
lKjSSszJhhG/2ZuZIfkXf2k2Z9vyi+Z0AhHjEJ1/lI8dGKGSEJskoukhQg04SGsl
0NjQAP8ezF/MnFcZiNLBilxquw5vq8xpJ5t+YlcjPnnA7YjWeYmssOajuUV2HPHg
+D/y7yv0P5ZjBMuIYRKT8XPu3otmR8krTH4cFI0KzCGH13hJm8h+O25N+9Bn1MUU
6NYGM4v8DFrM+3YGNdhAMakf9ZxjmiRnHaj9aukfFZo2hZfCQiN+0Y02p0SEge52
l0Poq8b7Sho=
=O+hc
-----END PGP SIGNATURE-----
