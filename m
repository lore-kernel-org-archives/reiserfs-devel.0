From: David Masover <jedi@ninja.dynup.net>
Subject: pseudo files & execute bit (Re: V4 status)
Date: Thu, 04 Dec 2003 21:50:30 -0600
Message-ID: <3FD00086.90607@ninja.dynup.net>
References: <16333.14692.61778.304155@pc7.dolda2000.com>	 <3FCD47C4.50500@ninja.dynup.net> <3FCE39B8.20307@namesys.com>	 <16334.15412.686909.927196@laputa.namesys.com> <1070580817.8344.140.camel@arabia.home.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070580817.8344.140.camel@arabia.home.lan>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Enrique Perez-Terron wrote:

>On Wed, 2003-12-03 at 20:40, Nikita Danilov wrote:
>...
>  
>
>> > > (for example, I should be able to do 'touch file; ls file'), I have 
>> > > had two problems there.  First, ls seems to know it's a file, and so I 
>> > > can't see any files within it.  Second, it needs the executable bit, 
>>    
>>
>... 
>  
>
>>Another problem ("ls seems to know it's a file") is with user level
>>programs that are sometimes too smart.
>>    
>>
>
>What happens on v4 if you do "ls -l file/." ?
>
>  
>
The same thing as if I do "ls -l file" (with the addition of a . on the 
end) anywhere else, if file has execute permission.  The problem is ls 
checks the file first and notices it's a file, and then refuses to try 
it as a directory.  The only way around this is to fool it -- ls works 
on file/..plugin, because that looks like a normal directory.

How about this:  some patch (or mount option) to VFS that would have 
directories be fully readable (as if there was an execute bit) if only 
the read bit is set?  This would definitely be backward-compatable with 
current filesystems, although to avoid some unnecessary ugliness there's 
a lot of programs that would need to be patched.

It would help if something could be fixed in Reiser4 (or VFS) to allow a 
file to appear as a directory.  I mean appear as one, so that ls works 
properly without needing to be patched.  Obviously lots of things are 
(hopefully) going to be patched to support Reiser4, and if this "remove 
execute bit from dirs" idea flies, I might be breaking, say, POSIX, as 
well as forcing most programs to be patched.

The reason I'm thinking this way is that I could easily see a use for 
(even if I have no idea how it'd work) a plugin on a directory to allow 
it to be read as a file.  The idea is to create drop-in replacements for 
current single files like /etc/passwd.  Say /etc/passwd is a directory, 
and inside that directory are numerous files, each with its own idea 
about the password file.  Reading from the directory as a file functions 
just as /etc/passwd, probably composing (maybe caching) the file out of 
its composite pieces.  Things like this are done all the time in a less 
clean fashion -- on my system, /etc/modules.conf is automatically 
generated from files in /etc/modules.d.  That works, it's just ugly, and 
not as automatic as it could be -- I have to type 'update-modules' to 
regenerate the file.

It would not make sense for /etc/passwd to be executable, but it would 
not make sense for /etc/modules.d to be unreadable.

Obviously there would be times when you want smaller objects attached to 
a normal file, like the permission plugin.  In the cases I've given, 
that may be a bad idea -- for example, we're told not to edit 
modules.conf directly.  It would be much nicer to have it be an fs 
plugin that doesn't support writing (but does cache itself), and maybe 
even strip things like comments in the process (since those would reside 
in the child dir).  This looks much cleaner to implement as a directory.

I'm sure it can be done with the pseudo-files I've seen, like linking 
/etc/passwd.d/..passwd to /etc/passwd, but I still think that's messy.

If I sound like I'm rambling, tell me -- maybe it's time for me to 
actually read the source.
"The power of the One extends beyond the Matrix, all the way to the 
Source..."
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9AAhgisZLIF6uqOAQK+Qw/+KeKNKcJCDqRIwgIsciyTq/pTHa93QMKA
FNrRMEzTC21wuyuECLzHR2BzvLIEHKbStt9MeHjqFbZOjd5EIWwCMfyzBMZqwdUe
1FFNwnOox8r/JogW4hzIQ0FvInQRmIVbdYdlLGem2ocfdSj7KvKhaJBTqNDNy49Q
7V/YTUZsldeik3a3AFzJyqok21BGLng2Je0czQigFEp2jGNzz/REO+IvUSc9ZCPa
RtHMBfgRP08U9CJAKXhN/DS0pP1LY9cHL+IeM25XSxFJM9sypCzck/VPn5tnxnGv
+M0c9FqdhB1Jd+bKyw2IoZsyjozGdrPAsNVRgR9Xh6+xY71M7tsOJ25TpoAXhQ31
ZGcNBGsBV5YmMM3gGZAf2nAOgpNPHzdOZ8qKHOuSrWfVCaknWnumhxLO9XnNqg9G
FBVIeFNbz3vAA082hpwb3V+X4McWFZfKawvud+sY+sKLiM7EHx917/hMDtZ4gjUN
afd4Bx0M0+rHg2oCyTCDZMeIscYx/9sDWb/xvnh3ZlG/U8E5+J5zAIKDewh8pyAz
PXLKmpZ+cVjBJjzQdon8JZNjMFi63uI3IS1KuUU4jNPmkzHQNEzY8NA3uqwD0w3K
4ukQpUu9MwOmec+xZkMCxij5cVcR8InmKFi6KtokkPO6b6jlcB6XUR3nHUkNvj0v
5fozwcB5mEM=
=yFiU
-----END PGP SIGNATURE-----

