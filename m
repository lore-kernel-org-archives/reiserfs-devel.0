From: Joachim Reichelt <Reichelt@gbf.de>
Subject: timestamps
Date: Mon, 26 May 2003 16:45:44 +0200
Message-ID: <3ED22898.703@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14262-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Dear all,

is there any way in Linux to get the time of the creation of a file or 
better
can i get:

creation time (is NOT in stat)
modification time ( is in stat m_time)
access time ( is in stat a_time)
c_time in stat changes, whenever a_time or m_time or ... changes, so 
useless here.

-- 
Mit freundlichen Gruessen                         Best Regards
 
         Joachim Reichelt

			SB  - Strukturbiologie
              GBF - Gesellschaft fuer Biotechnologische Forschung
                    German Research Centre for Biotechnology

WWW: http://www.gbf.de         _/_/_/   _/_/_/   _/_/_/_/
EMAIL: REICHELT@gbf.de       _/    _/  _/   _/  _/
                            _/        _/   _/  _/
Mascheroder Weg 1          _/  _/    _/_/_/   _/_/_/
D-38124 Braunschweig      _/    _/  _/   _/  _/
Tel: +(49) 531 6181 352  _/    _/  _/   _/  _/
FAX: +(49) 531 2612 388   _/_/_/  _/_/_/   _/

http://struktur.gbf.de/

-- Disclaimer --
Standard > Keyword : Opinions, my own, nobody else's, whatsoever ...

Man muss sich notfalls jemand mieten,
hat man an Geist selbst nichts zu bieten!     (Heinz Erhardt)


