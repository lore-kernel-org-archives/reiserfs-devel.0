From: Joachim Reichelt <Reichelt@gbf.de>
Subject: undelete open file
Date: Wed, 10 Mar 2004 13:22:49 +0100
Message-ID: <404F0899.2040000@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Dear all,

is there a way to undelete a file, that is still open?
lsof -C ... gives
Bragi   29736  jre   15r   REG        3,8  6828032    480646 
/home/jre/susanne_h/Model.md_ntr.mdcrd (deleted)

-- 
Mit freundlichen Gruessen                         Best Regards
 
         Joachim Reichelt

WWW: http://www.gbf.de         _/_/_/   _/_/_/   _/_/_/_/
WWW: http://www.gbf.de/sb    _/    _/  _/   _/  _/
                            _/        _/   _/  _/
Mascheroder Weg 1          _/  _/    _/_/_/   _/_/_/
D-38124 Braunschweig      _/    _/  _/   _/  _/
Tel: +(49) 531 6181 352  _/    _/  _/   _/  _/
FAX: +(49) 531 2612 388   _/_/_/  _/_/_/   _/

			SB  - Strukturbiologie
              GBF - Gesellschaft fuer Biotechnologische Forschung
                    German Research Centre for Biotechnology

See me at:
EMAIL: REICHELT@gbf.de    WWW:  http://www.gbf.de/sb/Reichelt.htm

-- Disclaimer --
Standard > Keyword : Opinions, my own, nobody else's, whatsoever ...

Man muss sich notfalls jemand mieten,
hat man an Geist selbst nichts zu bieten!     (Heinz Erhardt)

