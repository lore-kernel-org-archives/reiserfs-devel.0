From: Oleg Drokin <green@namesys.com>
Subject: Re: Strange message in log
Date: Tue, 19 Nov 2002 17:24:51 +0300
Message-ID: <20021119172451.A27634@namesys.com>
References: <3DDA4805.5080700@inway.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DDA4805.5080700@inway.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vitezslav T. Se'm" <travis@inway.cz>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Nov 19, 2002 at 03:17:41PM +0100, Vitezslav T. Se'm wrote:
>        Last Friday I installed my new workstation (RH7.3/redhat kernel 
> 2.4.18-18.7.x) and everytime I use mkreiserfs -h r5 /dev/partition it 
> writes a bit strange message into syslog.
> *******
> Nov 19 15:10:30 biker kernel: attempt to access beyond end of device
> Nov 19 15:10:30 biker kernel: 16:41: rw=0, want=80413328, limit=80413326
> *******
>        Partition is formated, mounted, used - everything OK. Is there 
> any problem with that syslog message?

mkreiserfs autodetects device size to be of different size than block device
driver thinks. Difference is 1k. So kernel logs attempt to read
behind the real device (mkreiserfs tries to check that end of device
is accessible).
There should be no further problems since the difference between two sizes is
less than blocksize.

Bye,
    Oleg
