From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Sun, 2 Aug 2009 16:21:00 +0200
Message-ID: <20090802142100.GA21160@elte.hu>
References: <20090731174642.GA6539@nowhere> <20090801081141.GA18036@basil.fritz.box> <20090801155335.GA4836@nowhere>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090801155335.GA4836@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>


* Frederic Weisbecker <fweisbec@gmail.com> wrote:

> > e.g. running all the file system stress tests from LTP would be 
> > a good idea, ideally multiple at a time on a multi processor 
> > system on a ram disk or perhaps AIM9.
> 
> Yeah good idea. But again, I fear my laptop hasn't enough memory 
> to support big enough ramdisks mount points to host selftests.

Well, dont waste too much time on it (beyond the due diligence 
level) - Andi forgot that the right way to stress-test patches is to 
get through the review process and then through the integration 
trees which have far more test exposure than any single contributor 
can test.

Patch submitters cannot possibly test every crazy possibility that 
is out there - nor should they: it just doesnt scale. What we expect 
people to do is to write clean patches, to test the bits on their 
own boxes and submit them to lkml and address specific review 
feedback.

	Ingo
