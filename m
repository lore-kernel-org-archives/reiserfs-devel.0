From: Oleg Drokin <green@namesys.com>
Subject: Re: Partitions corrupted - try getting original filenames
Date: Tue, 22 Apr 2003 14:58:03 +0400
Message-ID: <20030422145803.A11881@namesys.com>
References: <200304221232.58881.Wolfgang.Winkler@digital-concepts.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13756-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304221232.58881.Wolfgang.Winkler@digital-concepts.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Winkler <Wolfgang.Winkler@digital-concepts.at>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 22, 2003 at 12:32:58PM +0200, Wolfgang Winkler wrote:

> Yesterday our server crashed and corrupted our 2 raid partitions with 
> reiserfs. When I do a reiserfsck --rebuild-sb and reiserfsck --rebuild-tree 
> -S a lot of files are deleted and the rest goes to lost+found with this 
> inode-names. 

Why do you think you need -S switch to --rebuild-tree?
Do you have a copy of your filesystem in the state prior to running reiserfsck?
What kind of corruption was that?

> Is there a possibility to extract the original names of the files? Or, even 

If necessary tree nodes are present on disk and are intact, then it is most probably possible.

> better, can I do something different to restore the partition without having 
> everything in lost+found?

Sure. Don't use -S switch to --rebuild-tree, only you need the FS in it's original state,
the one before -S was run.

Also you might be interested to know that we have paid support service, details are at
http://namesys.com/support.html

Bye,
    Oleg
