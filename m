From: Jan Kara <jack@suse.cz>
Subject: Re: Is it time to remove reiserfs?
Date: Mon, 4 Apr 2022 15:05:11 +0200
Message-ID: <20220404130511.rq7evchtxk7s7dre@quack3.lan>
References: <YhIwUEpymVzmytdp@casper.infradead.org>
 <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
 <20220402105454.GA16346@amd>
 <20220404085535.g2qr4s7itfunlrqb@quack3.lan>
 <20220404100732.GB1476@duo.ucw.cz>
 <20220404101802.GB8279@1wt.eu>
 <20220404105828.GA7162@duo.ucw.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1649077513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wC86gbUg8Q4G9+5Yh9zn7w8RySmSqCqeIm64QO9mOtE=;
        b=RRl3Ow3dGGV/s0GtOYqND8FDvBjDPcuucOKEmxJhaBcg62IE3bwOhSXMJciuwie00la3Dt
        vIfvgni/VDrCBhutbnKt8xpngOFzHx/wcKTCF8tYsbDVCtNQg+wwBylUkJIqgBiNZBAaT7
        Sh95Qo2GYHO9iiR89s0vrUg4OpctFYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1649077513;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wC86gbUg8Q4G9+5Yh9zn7w8RySmSqCqeIm64QO9mOtE=;
        b=97OjsjXSzuzMn9M2iOy1/9cSLKyhZw16LE9piwwkUvv526LZ2e1h0R4Z7Gx6tzk2drEP5w
        WAJgVKn6SFSswSAQ==
Content-Disposition: inline
In-Reply-To: <20220404105828.GA7162@duo.ucw.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Willy Tarreau <w@1wt.eu>, Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Hello!

On Mon 04-04-22 12:58:28, Pavel Machek wrote:
> > So maybe you're right and there are still a bit more than expected out
> > there. However I really think that most users who still have one are in
> > the same situation as I am, they're not aware of it. So aside big fat
> > warnings at mount time (possibly with an extra delay), there's nothing
> > that will make that situation change.
> > 
> > At the very least disabling it by default in Kconfig and in distros
> > should be effective. I really don't think that there are still users
> > who regularly update their system and who have it on their rootfs, but
> > still having data on it, yes, possibly. The earlier they're warned,
> > the better.
> 
> I guess we should start by making sure that distributions don't use it
> by default. Big fat warning + delay is a bit harsh for that, talking
> to them should be enough at this point :-).
> 
> Someone start with Arch Linux ARM.

Yeah, I will write them and CC you. Thanks for notifying me.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
