From: Oleg Drokin <green@namesys.com>
Subject: Re: data loss with reiserfs
Date: Sat, 22 Jun 2002 13:41:24 +0400
Message-ID: <20020622134124.A1287@namesys.com>
References: <200206211920.38534.JPicht85@web.de> <200206212048.07920.JPicht85@web.de> <20020622114015.A4260@namesys.com> <200206221132.21918.JPicht85@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206221132.21918.JPicht85@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Picht <JPicht85@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Jun 22, 2002 at 11:32:21AM +0200, Julian Picht wrote:

> > What options have you passed to reiserfsck?
> I typed "reiserfsck --check /dev/hdb3"

This does not modify any data on the partition.

> > And have it reported anything other than "no errors"?
> It gave an status report while scanning, then said "no errors".

Well, then it must be something other that have freed the space.
There is a painful way of trying to restore all bits that were lost.
this is using -S switch in conjunction to --rebuild-tree in reiserfsck.
Note that most probably your partition would be destroyed after result, though
from bunch of files in /lost+found (and may be at old place) you may be able to
find what you are looking for. 

This doesnot give the answer to the question of why the data was lost, though.

Bye,
    Oleg
