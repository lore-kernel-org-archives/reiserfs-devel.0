From: Wolfgang Rohdewald <wolfgang@rohdewald.de>
Subject: Re: file attributes destroyed.
Date: Sun, 26 Oct 2003 18:05:21 +0100
Message-ID: <200310261805.21481.wolfgang@rohdewald.de>
References: <200310261227.18711.wolfgang@rohdewald.de> <200310261452.46275.wolfgang@rohdewald.de> <3F9BF652.1050303@namesys.com>
Reply-To: wolfgang@rohdewald.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F9BF652.1050303@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 26.10.2003 17:29, Hans Reiser wrote:
HR> Ah, wait, I forgot, did you ever use a kernel version older than 2.4.22 
HR> on this fs?  Could the corruption be from that time?

I am not sure how old this file system is but it has certainly seen 2.4.20
and 2.4.21.

However the files were still intact when I made my nightly backup last night.
I'll try reiserfsck later.

-- 
Wolfgang
