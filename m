From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Tue, 16 Mar 2004 23:10:04 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87k71kt8pv.fsf@uhoreg.ca>
References: <20040316224523.39093.qmail@web60408.mail.yahoo.com> <20040317024931.GB5731@exavio.com.cn>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Isaac" == Isaac Claymore <clay@exavio.com.cn> writes:

[...]

Isaac> Internally, the audio files are stored on a HFS+ filesystem,
Isaac> under a hierarchy structure very weird to us humans. But, by
Isaac> using iPod or the iTunes tool, the files are presented under
Isaac> various hierachy structures organized by file meta data, like
Isaac> artist, album, composer... And, that's far too convenient.

The Neuros does something similar too.  Everything is stored on a FAT
filesystem, but it maintains a database of all the songs.  Of course,
that means that you have to use a special program to add songs, or else
the database won't get updated.  So you can't just drag-and-drop, or cp
the files over, which is why, as Alexander mentioned, it's best to do
this in the filesystem level.

Isaac> I guess this kind of stuff can be done in user space, well and
Isaac> elegantly. Either a specialized application(e.g. iTunes), or some
Isaac> kind of user space filesystem will do. I also think this is best
Isaac> suited for storage of multimedia files, which naturelly come with
Isaac> much meta data.

And document files too.  I'm looking forward to being able to being able
to scrap this strange hierarchy system that I'm currently using for all
my documents.  Email, too, would do well with this system.  Just toss
all the mail in a single folder, and have your MUA query the filesystem
for mails from the ReiserFS list, or mails from friends, etc.

Isaac> And, I fail to figure out what benefit this can do to regular
Isaac> system files, like those under /etc, /boot...

/boot is probably tiny enough that it wouldn't benefit too much.  For
/etc, it might be helpful for those files that are related to both LDAP
and PAM, or both Apache and PAM, or network configuration and bootup, or
printing and hotplugging, or ...  Currently, "ls /etc | wc" on my system
gives 400 files.  I'm sure someone is creative enough to come up with a
solution to that mess.  I agree that /etc probably wouldn't benefit as
much as ~/music would, but I'm sure someone can come up with something
useful.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

