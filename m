From: Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Date: Mon, 18 Sep 2023 14:14:21 +0000
Message-ID: <20230918141359.11097-1-peter@n8pjl.ca>
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca> <20230918132614.zmmuc72purc2psik@quack3>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fUzcvVS2KRr+xQ1CNolJxMbnI9BleS2wfcJOdWRoHE=; b=JVMg4fP+tPp2g/
	P+2AvuhtDmtW3qrwxsjnfxwIcwt+nrtH7Ri3BoPnD85An7CgDbUHXDE0iqxH3cPyImYOccQDf8pJ0
	UCsnIR8lEYTUEBhCmbEUFJFAqeRcFseimufcuM5H/PQP83aFf2d3W+qLRlwwL/bMAJ2kL/g4TyKt9
	jx6/RfCDnYYmIcafHHAo26E6OPmUxbGrlvb8oADlGQpNGHTQj1x95anyAVufqf9TakbZjkzs8wBVi
	kgexauiyxlQL7f0xKNqAZ+WuVG9h6nQlKtMlbEDKuRIosuuj/ubuclGq+Ur3oAI99dVlJNRP5uzgm
	iK+FTMZQOusLACFpDiIg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
	s=protonmail2; t=1695046482; x=1695305682;
	bh=Km91J5JZrnd7URdpT5rh0YawCfFvdMqpbXm9xOXQn1s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=s58EZzuaw7picVWTRX+/V8Pt6XW9FVjJurAT1S3a3Quz+v++x4AqaBChG//SSRq4E
	 C6YmeJzLFS4YD5HbeQNxSxxfoVS8rMDEVPSaPF0/6w/fr4g8Mhv2qyYw0fEeqBSViI
	 wNNHg6iMiebglnBPXFBHRXtWP0P2uxKPeC3JT7vXnijFAxx6IlEYGV5JYE3giyN5Il
	 10cmybDZ3aJSgHJnQl9aBYlfWY1+3p4iOJedy4iIUb3T9nmtfKDkIvnkObtHCm8CTZ
	 LRH17HwP0oj4oVS26INgpzpeVfqFny0pAxwyLm3AzAyKfoicxxNWhP4ZmUo3rwmtPE
	 zdgznI8lt8ofQ==
In-Reply-To: <20230918132614.zmmuc72purc2psik@quack3>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: jack@suse.cz
Cc: Peter Lafreniere <peter@n8pjl.ca>, linux-um@lists.infradead.org, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org, richard@nod.at

On Monday, September 18th, 2023 at 09:26, Jan Kara <jack@suse.cz> wrote:
> On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> 
> > ReiserFS has been deprecated for a year and a half, yet is still built
> > as part of a defconfig UML kernel.
> > 
> > According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> > filesystem is slated to be removed in 2025. Remove it from the defconfig
> > profile now, as part of its deprecation process.
> > 
> > Signed-off-by: Peter Lafreniere peter@n8pjl.ca
> 
> 
> Makes sense but I've noticed there are many more architectures that define
> CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
> alpha). So perhaps we should do this for all of them when we are at it?

I agree. I can send a patch series for those arches except for ia64, which has
already been removed from linux-next.

> 
> Honza
> 
> > ---
> > Fixed invalid DKIM settings causing the previous patch to be rejected.
> > 
> > arch/um/configs/i386_defconfig | 1 -
> > arch/um/configs/x86_64_defconfig | 1 -
> > 2 files changed, 2 deletions(-)
> > 
> > diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
> > index e543cbac8792..9c9c77f1255a 100644
> > --- a/arch/um/configs/i386_defconfig
> > +++ b/arch/um/configs/i386_defconfig
> > @@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=y
> > CONFIG_UML_NET_MCAST=y
> > CONFIG_UML_NET_SLIRP=y
> > CONFIG_EXT4_FS=y
> > -CONFIG_REISERFS_FS=y
> > CONFIG_QUOTA=y
> > CONFIG_AUTOFS_FS=m
> > CONFIG_ISO9660_FS=m
> > diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
> > index 939cb12318ca..03b10d3f6816 100644
> > --- a/arch/um/configs/x86_64_defconfig
> > +++ b/arch/um/configs/x86_64_defconfig
> > @@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=y
> > CONFIG_UML_NET_MCAST=y
> > CONFIG_UML_NET_SLIRP=y
> > CONFIG_EXT4_FS=y
> > -CONFIG_REISERFS_FS=y
> > CONFIG_QUOTA=y
> > CONFIG_AUTOFS_FS=m
> > CONFIG_ISO9660_FS=m
> > --
> > 2.42.0
> 
> --
> Jan Kara jack@suse.com
> 
> SUSE Labs, CRi
