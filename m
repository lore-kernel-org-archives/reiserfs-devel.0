From: Tom Vier <tmv@comcast.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Thu, 1 Apr 2004 20:17:33 -0500
Message-ID: <20040402011733.GA2158@zero>
References: <20040330123546.GA5229@nysv.org> <200403301513.01851.christian.mayrhuber@gmx.net> <87hdw5vifk.fsf@uhoreg.ca>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87hdw5vifk.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, Mar 30, 2004 at 09:50:23PM -0500, Hubert Chan wrote:
> That effectively kills all filenames that contain @, much worse than
> just a "metas" conflict IMHO.

the djbdns utils (eg, dnscache) use files starting with @ for cache files.

i would prefer ".meta" *without* the 's'! i would also like to suggest "..."
if it hasn't already been.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
