From: "Daniel Harris" <starseed@webmail.co.za>
Subject: need help :)
Date: Thu, 27 Jun 2002 23:53:49 +0200
Message-ID: <200206272153.g5RLrlq16240@mailgate.mailbox.co.za>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi , I have had some trouble with my harddrive... when I try boot it i
just get a init# prompt, when I mount it I cannot view certain
directories like /proc , /sbin , /home etc .. I can't erase them
either. I need to if possible recover the contents of /home and other
directories.

Here is the log of what happens when I run reiserfsck on the drive :

grow_id_map: objectid map expanded: used 5120, 5 blocks
grow_id_map: objectid map expanded: used 10240, 10 blocks
grow_id_map: objectid map expanded: used 10240, 10 blocks
shrink_id_map: objectid map shrinked: used 14336, 15 blocks
shrink_id_map: objectid map shrinked: used 14336, 15 blocks
grow_id_map: objectid map expanded: used 15360, 15 blocks
grow_id_map: objectid map expanded: used 20480, 20 blocks
grow_id_map: objectid map expanded: used 20480, 20 blocks
grow_id_map: objectid map expanded: used 20480, 20 blocks
grow_id_map: objectid map expanded: used 20480, 20 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
grow_id_map: objectid map expanded: used 25600, 25 blocks
grow_id_map: objectid map expanded: used 25600, 25 blocks
grow_id_map: objectid map expanded: used 25600, 25 blocks
grow_id_map: objectid map expanded: used 25600, 25 blocks
shrink_id_map: objectid map shrinked: used 24576, 25 blocks
grow_id_map: objectid map expanded: used 20480, 20 blocks
grow_id_map: objectid map expanded: used 20480, 20 blocks
shrink_id_map: objectid map shrinked: used 19456, 20 blocks
check_semantic_pass: name "sbin" in directory 2 51382 points to
nowhere
are_file_items_correct: symlink found in indirect item 159732 83499
are_file_items_correct: symlink found in indirect item 159732 70387
are_file_items_correct: symlink found in indirect item 159732 83521
are_file_items_correct: symlink found in indirect item 159732 83509
are_file_items_correct: symlink found in indirect item 159732 83501
are_file_items_correct: symlink found in indirect item 159732 72759
are_file_items_correct: symlink found in indirect item 159732 62602
are_file_items_correct: symlink found in indirect item 159732 47187
are_file_items_correct: symlink found in indirect item 159732 65099
are_file_items_correct: symlink found in indirect item 159732 83515
check_semantic_pass: name "local" in directory 2 51382 points to
nowhere
dir 90688 105103 has wrong sd_size 120, has to be 80
are_file_items_correct: symlink found in indirect item 109229 86382
are_file_items_correct: symlink found in indirect item 96298 74350
dir 90688 105035 has wrong sd_size 296, has to be 112
dir 90688 105143 has wrong sd_size 152, has to be 48
dir 90688 105116 has wrong sd_size 280, has to be 96
dir 90688 105032 has wrong sd_size 120, has to be 80
dir 90688 105081 has wrong sd_size 296, has to be 144
check_semantic_pass: hash mismatch detected (changglog.Dgbian.gz)
dir 90688 105051 has wrong sd_size 144, has to be 104
are_file_items_correct: symlink found in indirect item 72876 73039
dir 90688 105131 has wrong sd_size 392, has to be 136
dir 90688 105055 has wrong sd_size 232, has to be 96



I would like to know if there is any method to fix this...



thanks



- Daniel Harris
_______________________________________________________________
 http://www.webmail.co.za the South-African free email service
