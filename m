From: David Masover <jedi@ninja.dynup.net>
Subject: Re: carrying links too far? (was Re: A bold idea (Re: Carrying Attributes
 too Far))
Date: Sun, 07 Dec 2003 10:17:18 -0600
Message-ID: <3FD3528E.6090401@ninja.dynup.net>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de> <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca> <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk> <3FD27FF2.3000907@ninja.dynup.net> <1070803113.3fd328a961d00@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070803113.3fd328a961d00@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

lrc1@st-andrews.ac.uk wrote:

>Quoting David Masover <jedi@ninja.dynup.net>:
>
>[...]
>
>  
>
>>lrc1@st-andrews.ac.uk wrote:
>>    
>>
>
>[...]
>
>  
>
>>The problem here is that if the link itself is on a different filesystem 
>>than the actual data, and the original filesystem gets nuked, what do I 
>>do about the link?  Traditionally, in order to delete a link, you drop 
>>the refcount of whatever it points to.  Here, you'd be left with the 
>>choice of either having a way to forceably remove a link, even if it 
>>can't adjust the refcount, and have "lost chains" or orphaned files, or 
>>you'd be left with certain links that you cannot remove without 
>>reformatting that filesystem -- possibly in the process creating more 
>>such links on other filesystems. 
>>    
>>
>
>If the child file's filesystem gets unmounted, then the external link to the 
>child file should normally be deleted; it certainly shouldn't be left hanging. 
>The child file won't just have a refcount; it will have pointers back to all of 
>its external parent directories (and possibly its internal ones too). So there's 
>no danger of external references being mistaken for ordinary internal ones. And 
>the external reference information can be used to figure out where to reconnnect 
>the filesystem when it is next remounted - exactly how is a longer story though.
>  
>
Aside from breaking the idea of a "hardlink" (forcing us to do "weak 
links"), there's the question of why would someone want to do this on 
any kind of system that is ever rebooted.  If I unmount the filesystems 
to reboot, I break (and thus remove) any hardlinks on other partitions.  
If the hardlinks are so fragile, what is the advantage over symbolic links?

> ...
>
>>I guess the main problem I have with this is that it only works when 
>>we're talking about all the filesystems on the local machine, and then 
>>only so far.  It kind of falls apart with removable filesystems like 
>>floppies and cds.
>>    
>>
>
>There are several different ways you can handle filesystems which are
>frequently mounted and remounted. Old single-tree filesystems can probably be
>adapted or fooled into working reasonably well with external hard links too. (I
>expect that making them work with multiple hard-links to directories would be
>more difficult.)
>  
>
Yes, it would be harder, because that would involve changing the method 
of garbage collection.  Hardlinks across filesystems only requires 
(depending on how well it's implemented) heavy use of fsck.  But that's 
only the technical details.  I get the feeling that the high-level 
design (as has already been shown) is much more difficult.  It seems 
that everyone agrees on what hardlinks to directories should look like, 
and it seems the worst danger is breaking "find".  No one seems to agree 
on what hardlinks across partitions should look like, if they should 
even be done at all.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9NSkgisZLIF6uqOAQKehA//UkGwdhTznO16VfgQpxUDxjGYD3wi8VT9
PF8b37WLEOC10p3L8gSf1gzx49zxGH0qcJjVS7vucZEoohfv7kn92g5k9Fm9hPXf
GrKVfV1p42jddAP9qthZ6drEWEoSkJWSngPleiq8IzVDwqptFfBs5tgvX/PqRA8a
agkAVEidfElJW/xOPYDGmJZ3PzeieChT21QmFUGIKCXEa4/N8vrbuerQxI2jpI8y
WGPNuRpvFB21JB1a3323arVdcQwGIh//sCGEtqI4359TtnVRXitoo6CHSQznerMy
UL3DMjHAPg0KJLFmMQE9st7mBQSyQDJIdb2UqdH9OZKQTqgl/x+dantU4jL4wFlx
b8ciJN2k4DeyDkhKlMFt+RMaPGd4uPYcF9R59Q5CUJO2eLpppQ/qBixS9td+zJN4
qomRfr18a7p0vOgkKcaGkW+sl/le19s55QG+i6x7Wru9uZq/JHG0L5yc/c0tXt0z
Auvqy7ZEeK1TjlMViXBdJ48jvw0zuk41d/DFPOpQKs26cpV0wc1c3M/JaZmXuzpo
e4Nrlegp0y4IbFiWt03VDBEq+durHU6m5fK6qaWA545j1EjsVqbGuTWyWkhk8YAE
B2tGHkO9WVytypOgi5Zj7Mmk1MaSyX9AA4ZK15Mr+Ks5VNxLMoY1fvTSCflPIYVp
J/TXcwDKHjc=
=FZzV
-----END PGP SIGNATURE-----

