From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: Reiser4 repackers
Date: Sun, 08 May 2005 13:37:30 +0000
Message-ID: <427E161A.40309@futuretg.com>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <1115335902.24839.4.camel@localhost> <427ADAA4.8000407@slaphack.com> <20050506035921.GF8179@gnu.org> <427C46EC.6080009@slaphack.com> <20050507102514.GH8179@gnu.org> <427D66FA.8050803@slaphack.com> <20050508010525.GL8179@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050508010525.GL8179@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Clausen <clausen@gnu.org>
Cc: David Masover <ninja@slaphack.com>, Jonathan Briggs <jbriggs@esoft.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Andrew Clausen wrote:

>On Sat, May 07, 2005 at 08:10:18PM -0500, David Masover wrote:
>  
>
>>>The blocklist is only needed to find the blocks in the nested file,
>>>which is huge.  (I don't know anything about reiser packing, but
>>>things like tail-merging aren't a serious problem.)
>>>      
>>>
>>Yet, it's still a problem.  You want a standardized way to map files to
>>underlying blocks, and before Reiser4, I'd say this was easy.  But now,
>>who knows what the FS does to bastardize the file on the way down?
>>Crypto/compression?  Tail-packing?  Stenography?  The possibilities are
>>endless...
>>    
>>
>
>Can't you disable these things for the special nested file?  You only
>need the block list for one file!
>  
>
This must be fine!


-- 
-- 

Check FT Websites ... http://www.futuretg.com  - ftp://ftp.futuretg.com
http://www.FTLinuxCourse.com
    http://www.FTLinuxCourse.com/Certification
http://www.RPMParadaise.org
http://www.YourPersonalOperatingSystem.com

Mobile: +39 393 665 4239
	Lancelot is back!
-- 

