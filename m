From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Date: Mon, 18 Sep 2023 16:24:58 +0200
Message-ID: <20230918142458.cwktedwchg5bm5cc@quack3>
References: <20230910232640.113938-1-peter@n8pjl.ca>
 <20230918125744.4342-1-peter@n8pjl.ca>
 <20230918132614.zmmuc72purc2psik@quack3>
 <20230918141359.11097-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4Jz0yWz30JkyNNWQAuleOPvY0zavGr+CYFxUXYhC4o=; b=3f9CLghtpEKRxE
	XXdge4gArSoKUGfdMJI+xcKIWxGiIuZ7GDToVAFya9/vHNwaNBlDU/p2mFpIwrZMPiHJrNadMUS6C
	79KeSBEiQKhOkKNIzzf2LugHG6V8GaGgXgAquA4gANmFOay3Wb3A70E/+56YxFk7BU/e3/oJLZec4
	jY7lGb8BuDGFoBdUjGeIwWbYVH17KOIlBni2+H2OohHYEhbcuerWkXNPigZBQMfOjmX+QPPWyTroA
	QWA5a+2oUaIRnppayUpO5GDTGhNoLP+g71/iws0tKE2TzZJF6636Opnoo/Jk+0uqK7ZMWOa0YuiBa
	N6E5cPK4DCkqqMu06psg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695047099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7k/zMUERva64SewvTMtFZgYEqcH6fC89q9sFyyJsq/k=;
	b=Cl7e3mvx918s/0zUuN7kT7+zYVdL6sMszlDz1QEmDIXo/ku1cks5d61Bx6NZyKw2Hv/Z85
	Yphvifl7ReKud1tVOfnn0uUb7N8e2IAF29cwib2jkC511YpIoBG1XcEJyOGlF2r6yo1ggp
	oW6Ki1FdHP4dbew/XIolCDspW/mcoUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695047099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7k/zMUERva64SewvTMtFZgYEqcH6fC89q9sFyyJsq/k=;
	b=Zr+B2n9JSNfwINesiPLJEqTd0qEXVM/hfLdX0H6Zf3DZN9mgd19Tm8kzd0OsK/SwmAVWh6
	s8dNKrYGpkvt1GCg==
Content-Disposition: inline
In-Reply-To: <20230918141359.11097-1-peter@n8pjl.ca>
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
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: jack@suse.cz, linux-um@lists.infradead.org, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org, richard@nod.at

On Mon 18-09-23 14:14:21, Peter Lafreniere wrote:
> On Monday, September 18th, 2023 at 09:26, Jan Kara <jack@suse.cz> wrote:
> > On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> > 
> > > ReiserFS has been deprecated for a year and a half, yet is still built
> > > as part of a defconfig UML kernel.
> > > 
> > > According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> > > filesystem is slated to be removed in 2025. Remove it from the defconfig
> > > profile now, as part of its deprecation process.
> > > 
> > > Signed-off-by: Peter Lafreniere peter@n8pjl.ca
> > 
> > 
> > Makes sense but I've noticed there are many more architectures that define
> > CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
> > alpha). So perhaps we should do this for all of them when we are at it?
> 
> I agree. I can send a patch series for those arches except for ia64, which has
> already been removed from linux-next.

Than would be great. Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
