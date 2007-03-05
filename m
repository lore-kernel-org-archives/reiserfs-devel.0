From: "John D. Heintz" <jheintz@pobox.com>
Subject: Trying to understand keys in terms of objects, items, and units.
Date: Mon, 5 Mar 2007 17:04:50 -0600
Message-ID: <c82045430703051504t1c3dc813mffdc1aea3b8754c0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_68064_21923908.1173135890682"
Return-path: <reiserfs-list-return-30585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:x-google-sender-auth;
        b=dP+TDRI2J//j67eWChCPauSMhaCQzx6jxeW817oD/X/HiVg8PGfMA9ZJnM2UajOlaUIkXRz8YAnwpUwFAUQ124W+40t0Ikvb5nRc7YagqtvJOib1689DttL+0hjs2UIjzricz+m3T5GGOrhhMSWdvqF2jkYdzKVDH2NFqd4hb90=
Sender: jheintz@gmail.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_68064_21923908.1173135890682
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

Can someone help explain to me the relationship between keys and
objects/items/units? Specifically, I'm confused by the reality that a single
file (object?) is identified by one key, but the individual parts
(stat_data, extends) each have their own keys as well. How does one key lead
to the others?

Are there any detailed examples of keys available? If the diagram from the
whitepaper here:
http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif could be
annotated to contain samples for:
 * a single directory,
 * two small files,
 * a large file (2-3 extents)
 * the stat_data (and item keys)
 * twig nodes showing delimiting keys and extent pointers
 * formatted nodes showing directory entries, stat_data
 * also, plugin id at the unit, item, and object levels would help!

I think that would be very helpful for people to understand how the tree and
plugins work.

I'm slogging through the code in my spare time, but I really hope someone
already knows the answers and will post an explanation!

The following statements in the V4 whitepaper led me to realizing the
storage layer was doing something with keys I didn't understand:

  "Everything in the tree has exactly one key."

  "These directory entries contain a name, and a key." (The Unix Directory
Plugin)

  "...more precisely, since a key selects not just the file but a particular
byte within a file, it returns that part of the key which is sufficient to
select the file, and which is sufficient to allow the code to determine what
the full keys for those various parts when the byte offset and some other
fields (like item type) are added to the partial key to form a whole key..."

  "The key can then be used by the tree storage layer to find all the pieces
of that which was named."

  "we can store just one key for the extent, and then we can calculate the
key of any byte within that extent."

Thanks,
John

-- 
John D. Heintz
Principal Consultant
New Aspects of Software
Austin, TX
(512) 633-1198

------=_Part_68064_21923908.1173135890682
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,<br><br>Can someone help explain to me the relationship between keys and objects/items/units? Specifically, I&#39;m confused by the reality that a single file (object?) is identified by one key, but the individual parts (stat_data, extends) each have their own keys as well. How does one key lead to the others?
<br><br>Are there any detailed examples of keys available? If the diagram from the whitepaper here: <a href="http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif">http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif
</a> could be annotated to contain samples for:<br>&nbsp;* a single directory,<br>&nbsp;* two small files,<br>&nbsp;* a large file (2-3 extents)<br>&nbsp;* the stat_data (and item keys)<br>&nbsp;* twig nodes showing delimiting keys and extent pointers
<br>&nbsp;* formatted nodes showing directory entries, stat_data<br>&nbsp;* also, plugin id at the unit, item, and object levels would help!<br><br>I think that would be very helpful for people to understand how the tree and plugins work.
<br><br>I&#39;m slogging through the code in my spare time, but I really hope someone already knows the answers and will post an explanation!<br><br>The following statements in the V4 whitepaper led me to realizing the storage layer was doing something with keys I didn&#39;t understand:
<br><br>&nbsp; &quot;Everything in the tree has exactly one
key.&quot;<br><br>&nbsp; &quot;These directory entries
contain a name, and a key.&quot; (The Unix Directory Plugin)<br><br>&nbsp; &quot;...more precisely,
since a key selects not just the file but a particular byte within a
file, it returns that part of the key which is sufficient to select
the file, and which is sufficient to allow the code to determine what
the full keys for those various parts when the byte offset and some
other fields (like item type) are added to the partial key to form a
whole key...&quot;<br><br>&nbsp; &quot;The key can then be used by the tree storage layer to
find all the pieces of that which was named.&quot;<br clear="all"><br>&nbsp; &quot;we can
store just one key for the extent, and then we can calculate the key
of any byte within that extent.&quot;<br><br>Thanks,<br>John<br><br>-- <br>John D. Heintz<br>Principal Consultant<br>New Aspects of Software<br>Austin, TX<br>(512) 633-1198

------=_Part_68064_21923908.1173135890682--
