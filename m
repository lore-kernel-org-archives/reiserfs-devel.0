From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 14:40:27 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87llg0mnl0.fsf@uhoreg.ca>
References: <412EEB75.1030401@namesys.com> <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
 <1888171711.20040827171520@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20930-reiserfs=m.gmane.org@namesys.com>
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

> Rik van Riel wrote:
>> On Fri, 27 Aug 2004, Hans Reiser wrote:
>>> Why are you guys even considering going to any pain at all to
>>> distort semantics for the sake of backup?  tar is easy, we'll fix it
>>> and send in a patch.

>> It's not as easy as you make it out, and not just because there are a
>> few dozen backup programs that need fixing.

>> The problem is more fundamental than that.  Some of the file streams
>> proposed need to be backed up, while others are alternative
>> presentations of the file, which should not be backed up.

Spam>   No, not really. This is a user decision and should be options in
Spam> the backup software.  I don't think it is up to the kernel,
Spam> filesystem, or the OS in general to decide what information the
Spam> user want to retain or not.

Why not just define an attribute named something like "do-not-backup"?
Then whatever program that generates the thumbnail can automatically add
the do-not-backup bit, and the backup software knows to ignore it.
(Obviously, that bit should apply recursively down the subtree.)

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

