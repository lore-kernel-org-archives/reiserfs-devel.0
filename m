From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Fri, 05 Dec 2003 23:01:56 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87fzfyr3uz.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
 <3FD00272.7040607@ninja.dynup.net>
 <1070617453.5605.13.camel@schlappix.schnulli.de>
 <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca>
 <3FD13313.9010506@ninja.dynup.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16260-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "David" == David Masover <jedi@ninja.dynup.net> writes:

[...]

>> There's more to security and good administration than just disk
>> quotas.  You can have different partitions mounted read-only.[1] You
>> have
>> 
David> And how is that different than chmod -x?  Root can remount a
David> partition writable just as easily as chmod'ing a file, unless the
David> partition is something like iso9660.

Yes.  Mounting a partition read-only mainly protects against
accidentally doing something stupid.  (e.g. "rm -rf /")

(What does "chmod -x" have to do with mounting read-only?  Or did you
mean "chmod -r"?)

>> different mount attributes such as nodev, nosuid, noexec.  You may
>> even want to take advantage of the fact that you can't hardlink
>> across partitions (you don't want users to be able to hardlink
>> programs from /usr/bin).  Separate partitions also allows you to
>> easily reinstall by
>> 
David> Why not?  (Naive question -- I can't see any problem here.)

There was a recent thread on Bugtraq about: if a user can hardlink from
/usr/bin, then they could link an suid program.  If a vulnerability is
discovered later, and the admin (or packaging program) just rm's the
file, the user still has access to it through his hard link.  (The
solution is to truncate the file to 0, drop the suid bits, and then rm,
but you might forget.)

>> blowing away your root partition (after copying your /etc), e.g. if
>> your system gets compromised.  And so forth.
>> 
David> There are many ways of doing this, including: copy to a network
David> server, make a temporary partition (after resizing the main one),
David> burning a CD, etc.

Yes, but being able to just blow away your root partition to reinstall
is a whole lot easier.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

