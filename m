From: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v2 92/92] fs: rename i_ctime field to __i_ctime
Date: Thu, 6 Jul 2023 08:19:46 +0900
Message-ID: <a482ca9b-9621-7363-0233-1c0bec15aa6c__41392.0929118589$1688599281$gmane$org@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-4-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688599209;
        bh=lKrue1sGsFTYklMQWRMbQ3My1e6nxD2ObDEGwR/VsF0=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=HLxmQwiZ1LmjUMMnuuRPPSyg4M265uTgwaRQNcugB9qBZelv5caqUlnlZ5FOkyCBO
         LA9nfmoC3VcwDcNYXdLwyrAjpQ8qAvbq7SFByp4Q0d8VX6Iv9VyTpE94IU21bzQwq7
         AXFUzX0mVEu7h6lf94UAW2WWe3aMpfRBaJ0VbFwIq54AZXBu03Eb370uSlX/QYxLnb
         UXNpYhAvkUoamOq5NO810kR9phlIz2t2HqAG1QMsAKmqwo0IMtrDOTVHIlTnm36wsc
         mJPYsNRjIZdhZzmDYmS/04VlnpppU6zobkiJuxMYBpvIxpIIrXPcePBFRLkFK603MQ
         3zkknzFWV7lIQ==
Content-Language: en-US
In-Reply-To: <20230705185812.579118-4-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Layton <jlayton@kernel.org>, jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com, surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com, marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net, luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com, e

On 7/6/23 03:58, Jeff Layton wrote:
> Now that everything in-tree is converted to use the accessor functions,
> rename the i_ctime field in the inode to discourage direct access.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

