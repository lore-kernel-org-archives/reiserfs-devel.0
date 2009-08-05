From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Thu, 6 Aug 2009 00:10:09 +0200
Message-ID: <20090805221008.GC5025@nowhere>
References: <20090731174642.GA6539@nowhere> <20090801081141.GA18036@basil.fritz.box> <20090801155335.GA4836@nowhere> <20090802142100.GA21160@elte.hu> <y0mzlah238y.fsf@fche.csb> <20090803060944.GB20762@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=KB8XoHhZNYoRhgB1Skd8yNQeBVYNtNNxXcW1OZPMYvE=;
        b=PJMcaHUtT/a6UxMRZvAG829xcgHdnaupuws6VFQR9R4GKoB+GeKF3eCyJENLhBKn9N
         c3VziYhhzNiGSXTEqJhjSvj7JukbEn2igQBMr2gJOuRFYvvo7pK+iWrtYx5HLovMaqwZ
         ZKIdwZf1rMbnt9KWMXYr+GCrD7pY7JhhNtWrU=
Content-Disposition: inline
In-Reply-To: <20090803060944.GB20762@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>, Al Viro <viro@zeniv.linux.org.uk>
Cc: "Frank Ch. Eigler" <fche@redhat.com>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>

On Mon, Aug 03, 2009 at 08:09:44AM +0200, Ingo Molnar wrote:
> 
> * Frank Ch. Eigler <fche@redhat.com> wrote:
> 
> > Ingo Molnar <mingo@elte.hu> writes:
> > 
> > >> Yeah good idea. But again, I fear my laptop hasn't enough 
> > >> memory to support big enough ramdisks mount points to host 
> > >> selftests.
> > >
> > > Well, dont waste too much time on it (beyond the due diligence 
> > > level) - Andi forgot that the right way to stress-test patches 
> > > is to get through the review process and then through the 
> > > integration trees which have far more test exposure than any 
> > > single contributor can test.
> > 
> > What guideline can you offer as to what is "due diligence" level 
> > of stress testing, as compared to delegating this task to 
> > eyeballed reviews + incidental use on the integration trees?
> 
> The kind of testing the VFS tree itself gets is a good starting 
> point i suspect - and it is a far more critical tree as it can 
> affects all filesystems. AFAICS the VFS tree relies on linux-next 
> and -mm for testing mostly and that's a good model IMO.
> 


I've asked Al Viro to integrate this branch in the VFS tree. He wasn't
opposed to that. Then I sent him the individual patches for integration
in VFS but hadn't any answer since then.

I've kept him cc'ed for any further patches too.

If Al still agrees about this integration, I would be pleased.

Frederic.

