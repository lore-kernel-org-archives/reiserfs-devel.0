From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: issues related to writing a file in reiser4
Date: Wed, 23 Mar 2005 17:26:35 +0000 (GMT)
Message-ID: <20050323172635.51889.qmail@web60104.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-335215554-1111598795=:50901"
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser-list mailing <reiserfs-list@namesys.com>

--0-335215554-1111598795=:50901
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,
  By doing debugfs on reiser4 and studying it I understand that the disk block address of the root node of on-disk tree as well as the complete on-disk tree gets  changed due to the creation of extent pointer.
For example:: suppose the root node is initally created at disk block 23. And the other nodes of the tree are say 24,25,26. Now suppose a extent gets created. This extent  has a length of 30 disk blocks.So now according to my observation the extent starts from disk block number 23 and extends till disk block number (23+30)53. and now the root node of the tree starts from block number 54..and the other nodes of the tree starts from 55,56,57 respectively. 
This means that whenever an extent is created the extents are stored and then the on-disk tree is stored to maintain locality of space. What is the advantage of such a policy???Isn't it shear overhead?
     Secondly when a file is created its entry has to be made in its respective directory i.e. in the directory entry item. The file is assigned the key which is the value that the field "next-oid" in the super block holds. But no matter when the file is created or what key it is assigned it is stored alphabetically in the tree. Even the stat data and the tail item of the respective file are inserted alphabetically. What is the use of alphabetical insertion? Is this useful in anyway during searching?
      Also if files are stored alphabetically and not according to the key order.Since the keys are generated sequentially but files are stored alphabetically the keys appear to be in random order on the disk. In this case how can the concept of delimiting keys be used???
regards,
pallavi


---------------------------------
  Yahoo! Messenger - Communicate instantly..."Ping" your friends today! Download Messenger Now
--0-335215554-1111598795=:50901
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>hello,</DIV>
<DIV>&nbsp; By doing debugfs on reiser4 and studying it I understand that the disk block address of the root node of on-disk tree as well as the complete on-disk tree gets&nbsp; changed due to the creation of extent pointer.<BR>For example:: suppose the root node is initally created at disk block 23. And the other nodes of the tree are say 24,25,26. Now suppose a extent gets created. This extent&nbsp; has a length of 30 disk blocks.So now according to my observation the extent starts from disk block number 23 and extends till disk block number (23+30)53. and now the root node of the tree starts from block number 54..and the other nodes of the tree starts from 55,56,57 respectively. <BR>This means that whenever an extent is created the extents are stored and then the on-disk tree is stored to maintain locality of space. What is the advantage of such a policy???Isn't it shear overhead?</DI
 V>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; Secondly when a file is created its entry has to be made in its respective directory i.e. in the directory entry item. The file is assigned the key which is the value that the field "next-oid" in the super block holds. But no matter when the file is created or what key it is assigned it is stored alphabetically in the tree. Even the stat data and the tail item of the respective file are inserted alphabetically. What is the use of alphabetical insertion? Is this useful in anyway during searching?<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Also if files are stored alphabetically and not according to the key order.Since the keys are generated sequentially but files are stored alphabetically the keys appear to be in random order on the disk. In this case how can the concept of delimiting keys be used???</DIV>
<DIV>regards,<BR>pallavi</DIV><p><hr size=1><font face="Arial" size="2"> <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com"><b> 
Yahoo! Messenger</b></a> - Communicate instantly..."Ping" your friends 
today! <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com/download/index.html"><strong>Download Messenger Now</strong></a></font>
--0-335215554-1111598795=:50901--
