From: Anders Widman <andewid@tnonline.net>
Subject: Re: Error messages.
Date: Wed, 5 Mar 2003 22:18:24 +0100
Message-ID: <9880275187.20030305221824@tnonline.net>
References: <93F527C91A6ED411AFE10050040665D0049C0798@CORPUSMX1>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049C0798@CORPUSMX1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>         Anders, you need the subsequent lines for the error to determine
> what the status error is. The 0x58 is a staatus error. It could be a status
> timeout, seek error, etc. The subsequent line generally tells you what it
> is. The faact you have noticed the errors diminished with DMA off or at the
> lower speeds seems to indicate possible timeouts.

The errors come even without DMA enabled.

Right now most of them contain "drive not ready for command".

>         To solve it - good hardware. Really! For instance, there is a Maxtor
> tool that allows you to examine the probational logs of the drive - areas of
> the disk that are suspected as bad. These are areas that aren't necessarily
> logged as a bad block but are on "probation" for the next write. They can
> cause these error messages to occur. Unfortunately, I don't believe the tool
> is available to the general populace. Sorry.

Well,  you  can  check  smart  levels  and thresholds and they are not
violated  yet.  Also, I do not believe that all 4 computer systems are
broken.  Especially  when  I  have run Windows on them for a long time
without any problems at all.


