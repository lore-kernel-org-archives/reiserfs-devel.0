From: Tom Vier <tmv@comcast.net>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 15:41:28 -0500
Message-ID: <20041230204128.GA18751@zero>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local> <m38y7gx8kq.fsf@merlin.emma.line.org> <20041230235911.4911a20c.hihone@bigpond.net.au> <m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name> <20041230174732.GB5206@favonius> <234966540.20041230192607@tnonline.net>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22979-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <234966540.20041230192607@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Alias rm to 'mv $@ trash/' (not sure about the $@ - my bash is rusty) and
have a cronjob that reaps files older than x. Or, try pdumpfs (i've been
using it for a long time).

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
