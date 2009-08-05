From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Wed, 5 Aug 2009 23:59:06 +0200
Message-ID: <20090805215904.GB5025@nowhere>
References: <20090731174642.GA6539@nowhere> <20090801081141.GA18036@basil.fritz.box> <20090801155335.GA4836@nowhere> <20090802142100.GA21160@elte.hu>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752898AbZHEV7O@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=cOisDqEjmEEONP9oOfybYmDjYjQnwLSOxVriUW1Wjqw=;
        b=WB6st4UVKo0xT3NjUj+9IKwZgW+X+SmWNJ5UKTkPbXLx64AgMEQ3gNtuwG8VixfFZ4
         pyxQywUXTxIM+Y+IBUhN8qkByyBvo5rSUqVslo6SBuq3Bi/iNr6dk6OMiMtc5s6T0nlR
         Mr2nbe1uTa+HhN6lKt15nPSPpqMIem3d+89JY=
Content-Disposition: inline
In-Reply-To: <20090802142100.GA21160@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>

On Sun, Aug 02, 2009 at 04:21:00PM +0200, Ingo Molnar wrote:
> 
> * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> 
> > > e.g. running all the file system stress tests from LTP would be 
> > > a good idea, ideally multiple at a time on a multi processor 
> > > system on a ram disk or perhaps AIM9.
> > 
> > Yeah good idea. But again, I fear my laptop hasn't enough memory 
> > to support big enough ramdisks mount points to host selftests.
> 
> Well, dont waste too much time on it (beyond the due diligence 
> level) - Andi forgot that the right way to stress-test patches is to 
> get through the review process and then through the integration 
> trees which have far more test exposure than any single contributor 
> can test.
> 
> Patch submitters cannot possibly test every crazy possibility that 
> is out there - nor should they: it just doesnt scale. What we expect 
> people to do is to write clean patches, to test the bits on their 
> own boxes and submit them to lkml and address specific review 
> feedback.
> 
> 	Ingo

Yeah, I know that doesn't scale. But I really would like to test it, at
least with the minimum scope I have.
Such fundamental change in a filesystem is scary :)
