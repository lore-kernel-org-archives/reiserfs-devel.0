From: Adrian Phillips <a.phillips@dnmi.no>
Subject: Re: Fsck over Telnet is slow.
Date: 31 May 2002 11:59:22 +0200
Sender: "Adrian Phillips,,," <a.phillips@dnmi.no>
Message-ID: <wv66147i4l.fsf@freeze.oslo.dnmi.no>
References: <1073646515.20020531102130@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1073646515.20020531102130@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Anders" == Anders Widman <andewid@tnonline.net> writes:

    Anders>    Is it just me, but I think reiserfsck is slow over
    Anders> telnet, or even slower over ssh. It seems as it would be
    Anders> better to not print the progress as fast, if the
    Anders> connection to the terminal is slow.

    Anders>    Of course, I could use a log file instead.

Try with -q (I think) instead,

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
