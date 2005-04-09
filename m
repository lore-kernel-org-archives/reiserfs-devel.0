From: David Masover <ninja@slaphack.com>
Subject: Re: Protect/Backup Encrypted FS
Date: Fri, 08 Apr 2005 23:18:45 -0500
Message-ID: <425757A5.10808@slaphack.com>
References: <200504051448.55893.shakim@bluebottle.com> <200504091156.28552.shakim@bluebottle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200504091156.28552.shakim@bluebottle.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shannon <shakim@bluebottle.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Shannon wrote:
> I haven't received a reply to this, so I'm going to be more specific:
> 
> When you create an encrypted partition, where is this configuration stored?
> 
> On Tue, 5 Apr 2005 02:48 pm, Shannon wrote:
> 
>>/		10GB	Reiser
>>/home	40GB	Reiser encrypted FS

v3 or 4?  Or, how are you encrypting your FS?

Look at your boot scripts, and your initrd if you have one.  You almost
certainly have to remember a passphrase and back up a key.  In any case,
if you are looking for the file, you might want to ask SuSe.

This only becomes a Reiser issue if you're using the reiser4 crypto
plugin, and I haven't heard anything about that being done.  If you are
encrypting a ReiserFS v3 filesystem, you are probably not using anything
Reiser specific -- it's probably something like cryptoloop or dm-crypt,
in which case you should google for those.

>>/swap	300mb
>>
>>
>>As per the harddrive configuration, if my / partition becomes corrupted or
>>if I choose to install a fresh copy of SuSe9.2 Pro over / and remount
>>/home, what do need to backup or how do I backup the files needed to
>>restore the encrypted partition /home

Do you mean "remount" or "reformat"?  If you are going to wipe out /home
and reformat, you don't need to do anything other than back up the files
in /home.  If you are planning to wipe out / and reinstall, but keep
/home, the config file you're looking for is /etc/fstab.

That still doesn't tell you how to deal with the encryption, though.
Until you can tell people what kind of encryption system you're using,
no one will be able to help you, and the ReiserFS list will probably
assume it's not their problem.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQldXpXgHNmZLgCUhAQI0HhAAgAIUclmsqicbVuSDg1ayKvgUL9zBHave
Eef+Ckoid/Y29ByG4+6J9MlJmaAnC9lF/I6MkUQooMPoxl6HZCLc5uRfMBl11rIb
mLpOOdR1SBRicNxNaI/3osfkciDR5bT47HTFoXWyqcVCX9DdjfEauNrVP+V8pvX2
iMmVqjG2BN9E5Kug/LecWvqHiWdIbTezp97Vych8vsLYNSdsZfqSuq/OfhI9xcPH
c9ZPfM8yGltPvUezHAZ/G2X+5915XP2vzoXsw4BHMmGzf7tdGGQYMiGXDu4DrAvV
KjgWFcPfBZ1smsU6wJooj6IBMrGdpQrQ91TWSKHaJcA/fXbNloF6w5U47F3fQ1YL
U4gG36dTK3qt+55lfU8CA1MQXU9J5567zMSLnzPPasmfegz/JXcm6XZuRZM4YtwT
g93DDs1rCPf+UZB+X6zYCXLMZD0ePkaq9wXWDMuaz65J/CXeIj9LDJ931K2XVjAR
A+fSDsuQCQQ7N8tJOYIdmwuciKAwlTefr1Kcm0z+5MXDuv0SOSuhMkShcezJetaf
malgqhigRt/Rf6xc83QCppohOFeh4fn2K7uRBfGsaZaTwsPiHM2gFzn8uoFCRvAv
JMdFaJ2yVHiCFix6hICX01b2aXyNxRuo80963Da1U2Yp0ztU6fTjFPx0b34BDQLA
QzAug1b05zA=
=wFMK
-----END PGP SIGNATURE-----
