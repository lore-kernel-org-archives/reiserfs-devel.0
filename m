From: Farafonoff <farafonoff@gmail.com>
Subject: Reiserfs lost data
Date: Sun, 13 Jul 2008 08:24:36 -0700 (PDT)
Message-ID: <18430405.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


today my PC had accidentaly reboot, now i have this

anima:/home/artem# ls -l /usr/lib/locale/
total 0
?--------- ? ? ? ?            ? /usr/lib/locale/locale-archive

i tried to do reiserfsck without rebuild-tree, but it didn't helped. what
should i do?
-- 
View this message in context: http://www.nabble.com/Reiserfs-lost-data-tp18430405p18430405.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

