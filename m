From: David Masover <jedi@ninja.dynup.net>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Sat, 06 Dec 2003 11:40:20 -0600
Message-ID: <3FD21484.3060802@ninja.dynup.net>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de> <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca> <3FD13313.9010506@ninja.dynup.net> <87fzfyr3uz.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87fzfyr3uz.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


>Yes.  Mounting a partition read-only mainly protects against
>accidentally doing something stupid.  (e.g. "rm -rf /")
>  
>
Good point.  However, the usual way to do that is "alias rm='rm -i' or 
to never give the root password to people who do things like that.  And 
if you're already backing up to protect against people breaking in and 
remounting it, you've already got a backup.

>(What does "chmod -x" have to do with mounting read-only?  Or did you
>mean "chmod -r"?)
>  
>
Actually, I meant "chmod -w".

>  
>
>>>different mount attributes such as nodev, nosuid, noexec.  You may
>>>even want to take advantage of the fact that you can't hardlink
>>>across partitions (you don't want users to be able to hardlink
>>>programs from /usr/bin).  Separate partitions also allows you to
>>>easily reinstall by
>>>
>>>      
>>>
>David> Why not?  (Naive question -- I can't see any problem here.)
>
>There was a recent thread on Bugtraq about: if a user can hardlink from
>/usr/bin, then they could link an suid program.  If a vulnerability is
>discovered later, and the admin (or packaging program) just rm's the
>file, the user still has access to it through his hard link.  (The
>solution is to truncate the file to 0, drop the suid bits, and then rm,
>but you might forget.)
>  
>
That's true, it'd probably be a good idea to either make it impossible 
to create a hardlink to a file you don't own or (the simpler solution) 
patch packaging software to do the truncating for you.  The second 
approach makes a lot of sense because some distros (maybe all of them?) 
make only /boot, /, and swap by default (just as I was describing).  
Maybe a "hardlink" permission flag?

>  
>
>>>blowing away your root partition (after copying your /etc), e.g. if
>>>your system gets compromised.  And so forth.
>>>
>>>      
>>>
>David> There are many ways of doing this, including: copy to a network
>David> server, make a temporary partition (after resizing the main one),
>David> burning a CD, etc.
>
>Yes, but being able to just blow away your root partition to reinstall
>is a whole lot easier.
>  
>
I use Gentoo, so there is no "easy" way to do an install -- it's always 
going to take a lot of crunching time, not necessarily a lot of your 
time.  So you do a network backup, automated, to, say, a web server.  
Then you download it and unpack it.  It's easier, sure, but not 
necessarily a lot easier.  Certainly not always a lot easier than 'rm -rf'.

I realize there are some good points made here, and I don't think it 
should be impossible to have separate partitions.  I do, however, think 
that most of these security issues and sanity checks are much easier to 
deal with (especially for a newbie) than managing 10-20 separate 
partitions, even with LVM.  (And that's ignoring the performance issues 
of LVM.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9IUhwisZLIF6uqOAQL6fQ//fIKObk9XFM76V7d8PqdWXiCB4EnaINR6
RlDoVgabeW0CMsd4G3fBY6nnuTVtEhC4HouF5nFfXfea0kHs7VmPvn1jjqQI/7/D
bDkY7fuBwt7WQg+9Kez4GtsTEtDHkVOLzpDwq9feI3ouw1t/IpzXkLc5PdgOAoB9
KaLLHp3jSeKa813t/sJLJfj03aPL+OPNlB5da3y1mqechLEXV2TQnGhTX70ReS6l
p4SPYeth6OI/5clEXPBx2omXHOTh9wGtjw1SOpP1JEFLqKZFEKpQhaSOIv71beW/
uMWRLDuf100cv2QYBgmibuxU+bmoZuIR+SAiOuJgGLgXUbwWs6yjedQR82lGb6xY
md3TB5PSaJZUpPil34hGQquwJvk7MHWsLinA9DkGMyyqWBkmPZl8kyAyZ8RbHhEd
Z/k14/VxeOh/ZYnlfVXJM0OLvfUZFHkyS7+G5BWmgqvg9+2xXYFsgRg1QLMu8OP0
x7KttP6Q8EgUCCJwjat4eQ0jHWQFHmko1sppFMZjeZqOw3E7sNvnKIeJVXYaMGu8
q3vQOGoYqtfDdBo2vHbKiMghPkNv7LcJ3K+LHlTqIKX9aAn0uVWmJqajuQn2JyBB
2DuwCUNcOGTPQzDjbv8t2iuix8hGP2O0ALhBNiz8lZ/JyHN2uubsa+18PdT+ddPG
wbPmiSaojNc=
=iN9Z
-----END PGP SIGNATURE-----

