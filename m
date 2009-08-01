From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Sat, 1 Aug 2009 10:11:41 +0200
Message-ID: <20090801081141.GA18036@basil.fritz.box>
References: <20090731174642.GA6539@nowhere>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090731174642.GA6539@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Andi Kleen <andi@firstfloor.org>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>

On Fri, Jul 31, 2009 at 07:46:43PM +0200, Frederic Weisbecker wrote:
> IV) Testing and review

You seem to have done a lot of benchmarks, but did you also do stress testing?

While a performance issue wouldn't be good, corrupting someone's file system
would be really bad.

e.g. running all the file system stress tests from LTP would be a good 
idea, ideally multiple at a time on a multi processor system on a ram
disk or perhaps AIM9.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
