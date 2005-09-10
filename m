From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: List of things requested by lkml for reiser4 inclusion (to review)
Date: Sat, 10 Sep 2005 13:14:53 +0300
Message-ID: <84144f0205091003147c15711@mail.gmail.com>
References: <200509091817.39726.zam@namesys.com> <4321C806.60404@namesys.com>
Reply-To: Pekka Enberg <penberg@cs.helsinki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750741AbVIJKOz@vger.kernel.org>
In-Reply-To: <4321C806.60404@namesys.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, LKML <linux-kernel@vger.kernel.org>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On 9/9/05, Hans Reiser <reiser@namesys.com> wrote:
> 8.  Remove all assertions because they clutter the code and make it hard to read

I don't think anyone suggested to remove _all_ assertions. I did,
however, suggested to tone down some of the ones that seem overly
defensive and clutter the code. If that is unacceptable to you and
maintainers can live with that then I have no problem with it either.

                                        Pekka
