From: David Masover <jedi@ninja.dynup.net>
Subject: more about links (was Re: A bold idea (Re: Carrying Attributes too
 Far))
Date: Tue, 09 Dec 2003 20:12:22 -0600
Message-ID: <3FD68106.7050800@ninja.dynup.net>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>	 <3FCE3716.8000509@namesys.com>	 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>	 <3FD00272.7040607@ninja.dynup.net>	 <1070617453.5605.13.camel@schlappix.schnulli.de>	 <3FD4E50D.6070805@nrao.edu> <1070956991.3579.12.camel@schlappix.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070956991.3579.12.camel@schlappix.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Heinz-Josef Claes wrote:

>Am Mo, 2003-12-08 um 21.54 schrieb Boyd Waters:
>  
>
>>-----BEGIN PGP SIGNED MESSAGE-----
>>Hash: SHA1
>>
>>Heinz-Josef Claes wrote:
>>
>>| I think hard linking directories is a very good idea. The should be a
>>| count for the number of hard links and it should be handled like with
>>| normal files. I directly have an application with would have a great
>>| benefit of this kind of hard linked directories, but up to now they are
>>| not available in linux :-(
>>
>>I use
>>
>>mount -o bind path/to/subdirectory path/to/mountpoint
>>
>>as a sort-of "hard-link" directories...
>>
>>    
>>
>Yes, that would look a little bit like a hard link. But I want to use it
>as a possiblity for my backup tool (see below). It makes a backup to
>another hard disk and hard links to files with a contents which is
>already in the backup. If a hole directory had not changed, I could make
>a link to the previous one and that's all. Now I have to mkdir the
>directories and hard link every single file. I could use much less space
>if there were an op
>
If a symlink really won't work for you, have the whole directory be a 
hardlink farm.  Trust me, it's cleaner that way.

My backup system involves using rsync to do that -- first I do a 'cp 
- -al' from the old generation dir to the new one.  Then I rsync over my 
current files.  Only the files that have changed are updated.

If that still isn't enough, use symlinks.  Some things which used to be 
hardlinks on my distro have been changed to symlinks, and I like the change.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9aBCgisZLIF6uqOAQK0YA/6AxzwZ33y1n+NVY/5WbJhFz30tcQDLcy4
l/5d8BQi75JGaGphuhb40+wh9omNQ+WBDYnTpL93XC2JeegmTbO5MYRqhTLyvfmD
oPkSNN9F3O1FdLDAIKJbJKu5zuQMulifzuqw1/Ru9j9Tck8JkRmlmCws/OFKoTTB
lN0IU9PiobBbOGrGpisfHARxy5rzVLXVpO3zUFLV8nrIdym2AVUi0sg4QAvfgaAT
FOLFDADdySPGFUyHoUYZ2dYNh9X+XiEw2fGJIvL1PzjfO+C9vWFpi5CW9goH3WKf
FInlVTkhijJPVi/lhRG2MnMcih64IH0xgTlm8jUBlgwnxc1/rncjBwISJNu+v7Si
y0yOa+CWcCajoiYrLrTzUI7ltDiynhZWhJClGGXIdqdpD606taU5N9t7nZk6TkTT
2fnXEnTSUaOp+vjNT2HsZ287ZITmCeMfD4O3okqbmTEM+Tg6fzxRgF45p3h2mKxn
44lLEBJY22rvVsOkZseP/Ar82fknyaHBIQy9BH2ZMwptPBbD8Nb40PH3FciZMdta
5D+emORumurMe8vnYNesl7NKQUZ/kKeEBZ87Pg2MQHKJbPRG+HzrIBtkhsXGa30n
UqnX8vvZGrDRZvJJKh98u6ljRVrhPVgz7hzpDpZsU1U2Kx0VfmLaHF1/VHNcKKjp
8Vu0oMwEwVQ=
=S65a
-----END PGP SIGNATURE-----

