From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 02:02:23 +0200
Message-ID: <6561987.20040828020223@tnonline.net>
References: <412EEB75.1030401@namesys.com>
 <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
 <1888171711.20040827171520@tnonline.net> <87llg0mnl0.fsf@uhoreg.ca>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87llg0mnl0.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org


  

>>>>>> "Spam" == Spam  <spam@tnonline.net> writes:

>> Rik van Riel wrote:
>>> On Fri, 27 Aug 2004, Hans Reiser wrote:
>>>> Why are you guys even considering going to any pain at all to
>>>> distort semantics for the sake of backup?  tar is easy, we'll fix it
>>>> and send in a patch.

>>> It's not as easy as you make it out, and not just because there are a
>>> few dozen backup programs that need fixing.

>>> The problem is more fundamental than that.  Some of the file streams
>>> proposed need to be backed up, while others are alternative
>>> presentations of the file, which should not be backed up.

Spam>>   No, not really. This is a user decision and should be options in
Spam>> the backup software.  I don't think it is up to the kernel,
Spam>> filesystem, or the OS in general to decide what information the
Spam>> user want to retain or not.

> Why not just define an attribute named something like "do-not-backup"?
> Then whatever program that generates the thumbnail can automatically add
> the do-not-backup bit, and the backup software knows to ignore it.
> (Obviously, that bit should apply recursively down the subtree.)

  This  is  about  the  same  idea  as the archive flag in DOS/Windows
  environments.  It  didn't really work to well IMO. If meta files are
  definable  by  users/application then the backup system could create
  its own meta files with the specific information it needs.

  ~S

  

