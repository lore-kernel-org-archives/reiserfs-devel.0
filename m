From: Oleg Drokin <green@namesys.com>
Subject: Re: quotas in 2.4.20
Date: Sat, 25 Jan 2003 12:09:49 +0300
Message-ID: <20030125120949.A8569@namesys.com>
References: <1043463722.3e31fe2a3e267@correo.iteso.mx>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1043463722.3e31fe2a3e267@correo.iteso.mx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jos? A. Guzm?n" <jose@iteso.mx>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Fri, Jan 24, 2003 at 09:02:02PM -0600, Jos? A. Guzm?n wrote:

>  I'm trying to get quotas working on 2.4.20.
>  So far they seem to work ok with the dec-3-2002 patches from: 
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20/ 
> with CONFIG_QFMT_V2.
>  However the patch from jan-22-2003 in: 
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/01-iput-deadlock-fix.diff
> does not apply on top of the testing/quota-2.4.20 patches.

Yup.
You do not need that patch if you are using quotas, as it is already in ;)
I will rediff quota patches against new 2.4.21-pre later.

>  Also, when compiling a 2.4.20 kernel with testing/quota patches and the latest
> evms 1.2.1 patches, compilation stops with:
> fs/fs.o: In function `fsync_dev_lockfs':
> fs/fs.o(.text+0x31a8): undefined reference to `DQUOT_SYNC'

Hm, that's strange. Do evems guys touch quota code at all?

>   Are the testing/quota patches recommended for a production box with 2.4.20?
> (Debian 3.0, quota 3.08)

Well, they seem to work well enough. There is no bugreport that I can assotiate with
this quota code for sure.

>   Is there a way to get EVMS working with quotas?

Hm. What are evms guys thoughts on that issue?

Bye,
    Oleg
