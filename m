From: Chao Yu <yuchao0@huawei.com>
Subject: Re: [PATCH] fs/*/Kconfig: drop links to
 404-compliant http://acl.bestbits.at
Date: Thu, 14 Dec 2017 18:39:40 +0800
Message-ID: <8b0816ac-186e-77ec-68d9-d28e90d0d5d1__42393.8836124309$1513263371$gmane$org@huawei.com>
References: <20171213053825.10903-1-kilobyte@angband.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <jfs-discussion-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7MpyNzbpAQoOv2tbramQhdORGYh2S8qznrdVozXzlbc=; b=G5v7vMwjhepizX2lekmlwQPduE
 BUQUEj6a2hxGxFxzytuUsgVfGxhc9700j9fYUllE7xc3bfa7W9FXs6Mcckyatqc1lNBGutBNQHMpG
 r0fJRT8jOwZDQSLLK/eiXkaDFq/6vxIH81J7jkJtyJjtQlxr3oWRlXLT5ogj2t0Wfpj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7MpyNzbpAQoOv2tbramQhdORGYh2S8qznrdVozXzlbc=; b=N0q1XqMwuv0qoGieH/CyUoc5fH
 hjrJbeNaOIOVkAsjojXh2SJ9sEfno0UVcgKBYNo8Kjt4FnN40ga/Med72tatouJgi9aJ392fVpJiW
 m6hIJJbg6npv3phlBSp1CTw2qY8VYY2DhWuNIFpT1Rk85ESd2kFBWmVP53ymUnpTD8Zg=;
In-Reply-To: <20171213053825.10903-1-kilobyte@angband.pl>
Content-Language: en-US
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/jfs-discussion>, 
 <mailto:jfs-discussion-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=jfs-discussion>
List-Post: <mailto:jfs-discussion@lists.sourceforge.net>
List-Help: <mailto:jfs-discussion-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/jfs-discussion>, 
 <mailto:jfs-discussion-request@lists.sourceforge.net?subject=subscribe>
Errors-To: jfs-discussion-bounces@lists.sourceforge.net
To: Adam Borowski <kilobyte@angband.pl>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, Jonathan Corbet <corbet@lwn.net>, linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Eric Van Hensbergen <ericvh@gmail.com>, Ron
 Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, "Yan, Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Dave Kleikamp <shaggy@kernel.org>, 

On 2017/12/13 13:38, Adam Borowski wrote:
> This link is replicated in most filesystems' config stanzas.  Referring
> to an archived version of that site is pointless as it mostly deals with
> patches; user documentation is available elsewhere.
> 
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

[skip]

> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 378c221d68a9..9a20ef42fadd 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -35,8 +35,7 @@ config F2FS_FS_XATTR
>  	default y
>  	help
>  	  Extended attributes are name:value pairs associated with inodes by
> -	  the kernel or by users (see the attr(5) manual page, or visit
> -	  <http://acl.bestbits.at/> for details).
> +	  the kernel or by users (see the attr(5) manual page for details).
>  
>  	  If unsure, say N.
>  
> @@ -49,9 +48,6 @@ config F2FS_FS_POSIX_ACL
>  	  Posix Access Control Lists (ACLs) support permissions for users and
>  	  groups beyond the owner/group/world scheme.
>  
> -	  To learn more about Access Control Lists, visit the POSIX ACLs for
> -	  Linux website <http://acl.bestbits.at/>.
> -
>  	  If you don't know what Access Control Lists are, say N
>  
>  config F2FS_FS_SECURITY

Looks good to me.

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
