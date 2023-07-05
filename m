From: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v2 07/92] fs: add ctime accessors infrastructure
Date: Thu, 6 Jul 2023 08:12:54 +0900
Message-ID: <96225b66-61df-ce60-4581-d34f345210a1__28220.3354219504$1688598820$gmane$org@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-2-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688598798;
        bh=dbVAcwdmAronKN2/exh+7rTyLVmJxnKKBZZH/rfELec=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=di4vANHGk01g6BG5D+kP8/xay3uXUiIBLtBnwrNkmTzBqnQe5y4Yy3r3sKprZdrZU
         hLYRxm6m/yexaa2MvMrDAkxslOrCPsdA+8QIJT4XlTSOO9bW5v7MHkxYlPIViPfKeF
         fRn/+0zT6OSrjtw22jXVBH/ovhdvc9vkFCNM1EBs2VjepM0ULrtRhvag5CPbr192w0
         cRcfbru+GTcRyXj7Wbzq75c7s6EGwzFcQQiKkr0Wkg0zmTaRA5F4rovPj6XXBdkkmN
         kDb1CQGmDyQbWx+r141kxp0SAX3Yzem7fUjViBscjxeGvouGbK76BC9mhrZWRfN3n1
         Ec6Ry2aMc3ZpQ==
Content-Language: en-US
In-Reply-To: <20230705185812.579118-2-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Layton <jlayton@kernel.org>, jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com, surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com, marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net, luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com, e
Cc: Jan Kara <jack@suse.cz>

On 7/6/23 03:58, Jeff Layton wrote:
> struct timespec64 has unused bits in the tv_nsec field that can be used
> for other purposes. In future patches, we're going to change how the
> inode->i_ctime is accessed in certain inodes in order to make use of
> them. In order to do that safely though, we'll need to eradicate raw
> accesses of the inode->i_ctime field from the kernel.
> 
> Add new accessor functions for the ctime that we use to replace them.
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

