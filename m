From: Oleg Drokin <green@namesys.com>
Subject: Re: [Fwd: Problems]
Date: Mon, 24 Jun 2002 08:58:04 +0400
Message-ID: <20020624085804.A4359@namesys.com>
References: <3D136574.7090607@moredata.pt> <20020621214414.A947@namesys.com> <3D15FA4C.4080501@moredata.pt>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D15FA4C.4080501@moredata.pt>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlos Rodrigues <rcarlos@moredata.pt>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Jun 23, 2002 at 05:41:48PM +0100, Carlos Rodrigues wrote:

> i run the "reiserfsck --check" with log, the file attach is the report, 
> when i run the --rebuild-tree i wil lose my data ?

No. You shouldn't lose the data with such a corruption.
It only indicates that some files share some data blocks.
These blocks should be cloned.

> i've the last version of reiserfs tools "reiserfsprogs 3.x.1b", this is 
> the last, right ?

Yes.

Bye,
    Oleg
