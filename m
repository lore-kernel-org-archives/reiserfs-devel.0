From: David Masover <jedi@ninja.dynup.net>
Subject: carrying links too far? (was Re: A bold idea (Re: Carrying Attributes
 too Far))
Date: Sat, 06 Dec 2003 19:18:42 -0600
Message-ID: <3FD27FF2.3000907@ninja.dynup.net>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de> <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca> <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

lrc1@st-andrews.ac.uk wrote:

> ...
>
>The solution I suggest is to throw out the "one volume, one tree" requirement.
>The volume's tree then becomes a forest, with every file with no parent in the
>volume being the root of a tree. (Of course, if you also have multiple
>hard links to directories, then the trees are instead directed, acyclic
>graphs.) You could think of them all as being mount points, but in fact the
>volume would have no fixed mount points at all.
>  
>
Cool, but the problem there is that it is now possible to have broken 
hardlinks.  Broken symlinks we're all used to, but broken hardlinks 
usually represent a more critical problem.

>Taking a step back, if all the filesystems on a system were so, then any file in
>any location in the computer's global filesystem tree (or graph) could in
>principle be on any of the computer's (sub)filesystems regardless of what
>(sub)filesystem its parents were on. Thus the answer to your question above
>  
>
The problem here is that if the link itself is on a different filesystem 
than the actual data, and the original filesystem gets nuked, what do I 
do about the link?  Traditionally, in order to delete a link, you drop 
the refcount of whatever it points to.  Here, you'd be left with the 
choice of either having a way to forceably remove a link, even if it 
can't adjust the refcount, and have "lost chains" or orphaned files, or 
you'd be left with certain links that you cannot remove without 
reformatting that filesystem -- possibly in the process creating more 
such links on other filesystems.  Or you could just not have the 
refcounts (or, indirectly, the deletion of the file) have anything to do 
with any hardlinks (maybe "firmlinks"?) on other partitions/filesystems, 
but then the file goes away when all hardlinks are gone, leaving these 
"firmlinks" broken.

I guess the main problem I have with this is that it only works when 
we're talking about all the filesystems on the local machine, and then 
only so far.  It kind of falls apart with removable filesystems like 
floppies and cds.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9J/8gisZLIF6uqOAQLqyg/+PwacI8rg+seKyxunxWA5MJ7KuOYjkshx
PmmoMCFBCg/P/Ygm12q3vK+GJdIKDzAPWY6xoGtTAQclyihbvm9qV3DxMdeoteGG
rS+P2sEaQrfvzEnGMW7JpdWl+Y9EAUhJV/7bUblZRsAUKenASW5K/CM4LnYIohKN
ZJAet6nKdhCR9i3nTQ7k16FU5AV6jg4n/CEpdSFsgkqbWbM/fJ9O3tGFEsk3AnZM
NCKfYjsQybNX1gQYyG66sUNL5wtsYfTUAS6G+87p8CvfvmS4BPkMuhcEA5r9olO+
YefrO7vxX/hP7eVmBbTwktnpsUDV+Z53/+U5rMELFGlfIsUJ+NYcdZDkX4lsrFqO
4fBFpqysUmJc/z7LUsbf5uB6cB/5TVcgcQLoqbWPcFEb8snr5acDe0RLlbqY7BJb
NK/VSLlVG+DE2bnoIz2CfaLPIAEhf0V0Pf8v27wrmZ6JKrzZ6tEdBAzshv7qXxlx
z6ns8iCuiPGlwlxglTE9nKL9Cvjw8t+O2yOd4weu41MEMnwkpr3Fbza6nPFyKBJI
UaTgf+7O+2wAXfsy4g6ZaUdtJaeKoix+dSKsb/F8Q1gJfacxkC0MiRhG3mcUKFPa
YrHBQtts1dNsWw2o8IscA1o2u23J2lQkw45d8TkX7xxS4AJfkuevHzNI5abIFbzD
DAHEzyys3w4=
=1dYB
-----END PGP SIGNATURE-----

