From: Joachim Reichelt <Reichelt@gbf.de>
Subject: Re: Archiver
Date: Mon, 28 Apr 2003 12:44:13 +0200
Message-ID: <3EAD05FD.3080107@gbf.de>
References: <3EACFF00.6030507@gbf.de> <3EAD0062.7060603@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EAD0062.7060603@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com



Hans Reiser schrieb am 04/28/2003 12:20 PM:

> Joachim Reichelt wrote:
>
>> Dear all,
>>
>> I know, it is a little bit out of topic, but we are looking for 
>> Software to archive our data held on
>> ~400GB reiser fs.
>> We want to have exact one copy on tape of each file that is on our 
>> system at e.g. midnight.
>> Only new or changed files should go to tape.
>> Tapes are in an robot system of ~2TB.
>>
> lvm snapshots and dd or tar?
>
The data are on hardware raid, no lvm.
Tar: How to exclude all file the are on tape jet?
Where/How to find old files?
I think of features as seen in legatho, something like a HSM system

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



