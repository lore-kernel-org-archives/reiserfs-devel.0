From: Hans Reiser <reiser@namesys.com>
Subject: Re: file attributes destroyed.
Date: Sun, 26 Oct 2003 19:27:45 +0300
Message-ID: <3F9BF601.3000803@namesys.com>
References: <200310261227.18711.wolfgang@rohdewald.de> <200310261550.06162.vitaly@namesys.com> <3F9BB8DD.5040800@namesys.com> <200310261445.23681.wolfgang@rohdewald.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310261445.23681.wolfgang@rohdewald.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: wolfgang@rohdewald.de
Cc: reiserfs-list@namesys.com, vs@thebsh.namesys.com

Wolfgang Rohdewald wrote:

>On 26.10.2003 13:06, Hans Reiser wrote:
>HR> Are you using the SuSE kernel?
>
>No, Debian unstable with a standard 2.4.22 kernel augmented with ibcs2, qc-usb.
>I am using ibcs2 since years and qc-usb since several months.
>
>HR> Are you using NFS?
>
>Never.
>
>/usr/src/linux# grep -i nfs .config
># CONFIG_NFS_FS is not set
># CONFIG_NFS_V3 is not set
># CONFIG_NFS_DIRECTIO is not set
># CONFIG_ROOT_NFS is not set
># CONFIG_NFSD is not set
># CONFIG_NFSD_V3 is not set
># CONFIG_NFSD_TCP is not set
># CONFIG_NCPFS_NFS_NS is not set
>
>  
>
Vladimir, please look into this.

-- 
Hans


