From: fche@redhat.com (Frank Ch. Eigler)
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Sun, 02 Aug 2009 19:41:01 -0400
Message-ID: <y0mzlah238y.fsf@fche.csb>
References: <20090731174642.GA6539@nowhere>
	<20090801081141.GA18036@basil.fritz.box>
	<20090801155335.GA4836@nowhere> <20090802142100.GA21160@elte.hu>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753971AbZHBXmD@vger.kernel.org>
In-Reply-To: <20090802142100.GA21160@elte.hu> (Ingo Molnar's message of "Sun, 2 Aug 2009 16:21:00 +0200")
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>

Ingo Molnar <mingo@elte.hu> writes:

>> Yeah good idea. But again, I fear my laptop hasn't enough memory 
>> to support big enough ramdisks mount points to host selftests.
>
> Well, dont waste too much time on it (beyond the due diligence 
> level) - Andi forgot that the right way to stress-test patches is to 
> get through the review process and then through the integration 
> trees which have far more test exposure than any single contributor 
> can test.

What guideline can you offer as to what is "due diligence" level of
stress testing, as compared to delegating this task to eyeballed
reviews + incidental use on the integration trees?

- FChE
