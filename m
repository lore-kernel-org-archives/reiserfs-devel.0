From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 20:32:26 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87sma8kspx.fsf@uhoreg.ca>
References: <412EEB75.1030401@namesys.com> <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
 <1888171711.20040827171520@tnonline.net> <87llg0mnl0.fsf@uhoreg.ca>
 <6561987.20040828020223@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Spam" == Spam  <spam@tnonline.net> writes:

> Hubert Chan wrote:
>> Why not just define an attribute named something like
>> "do-not-backup"?  Then whatever program that generates the thumbnail
>> can automatically add the do-not-backup bit, and the backup software
>> knows to ignore it.  (Obviously, that bit should apply recursively
>> down the subtree.)

Spam>   This is about the same idea as the archive flag in DOS/Windows
Spam> environments.  It didn't really work to well IMO.

Similar, but not the same.  IIRC, the purpose of the archive flag was to
mark which files had been modified since the last backup, wherein you
get into conflicts if you have several backup-like utilities.  (I'm
trying to forget about the DOS days. ;-) ) A do-not-backup attribute
would flag that a file should never be backed up.

Spam> If meta files are definable by users/application then the backup
Spam> system could create its own meta files with the specific
Spam> information it needs.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

