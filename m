From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiserfs lost data
Date: Sun, 13 Jul 2008 21:16:09 +0400
Message-ID: <487A3859.9070005@gmail.com>
References: <18430405.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <18430405.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Farafonoff <farafonoff@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Farafonoff wrote:
> today my PC had accidentaly reboot, now i have this
>
> anima:/home/artem# ls -l /usr/lib/locale/
> total 0
> ?--------- ? ? ? ?            ? /usr/lib/locale/locale-archive
>
> i tried to do reiserfsck without rebuild-tree, but it didn't helped. what
> should i do?
>   

Any related kernel messages?
What does reiserfsck with no options report?


Thanks,
Edward.
