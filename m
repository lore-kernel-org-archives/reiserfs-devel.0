From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Snapshot against 2.6.1 released.
Date: Tue, 20 Jan 2004 10:10:47 -0800
Sender: Mike Fedyk <mfedyk@srv-lnx2600.matchmail.com>
Message-ID: <20040120181047.GB23765@srv-lnx2600.matchmail.com>
References: <20040120080223.2921.qmail@web21505.mail.yahoo.com> <20040120101145.48843.qmail@web21503.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040120101145.48843.qmail@web21503.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Correnti <paolunix@yahoo.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Domenico Andreoli <cavok@libero.it>, reiserfs-list@Namesys.COM

On Tue, Jan 20, 2004 at 02:11:45AM -0800, Paolo Correnti wrote:
> P.S. Of course, pay attention to have always a "backup
> partition" to be able to copy all your Reiser4 data
> before testing new snapshots.

Right, and keep a copy of the data from *before* you copied the data on that
non-reiser4 partition.

If you have another empty filesystem around for scratch data, you can use
reiser4 for that, but not for data you care about.
