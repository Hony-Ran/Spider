#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# Author:Hony
# 同步阿里云OSS的文件

import oss2
import os

path = r'C:\Users\Administrator\Desktop\1'
oss_dir_name = path.split('\\')[-1]
oss_dir = 'qikaidesheng/14926056/'
for root, dirs, files in os.walk(path):
    for file in files:
        dir_path = root.split('\\')[-1]
        if dir_path == oss_dir_name:
            OSS_dir = f'{oss_dir}' + f'{file}'
            Local_dir = os.path.join(root, file)
        else:
            OSS_dir = oss_dir + f'{dir_path}/' + f'{file}'
            Local_dir = os.path.join(root, file)
        auth = oss2.Auth('KEY', 'VALUE')
        bucket = oss2.Bucket(auth, 'WEBSITE', 'BUCKET')
        bucket.put_object_from_file(f'{OSS_dir}', Local_dir)