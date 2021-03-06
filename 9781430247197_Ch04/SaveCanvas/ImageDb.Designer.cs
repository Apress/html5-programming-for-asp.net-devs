﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.ComponentModel;
using System.Data.EntityClient;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Runtime.Serialization;
using System.Xml.Serialization;

[assembly: EdmSchemaAttribute()]
namespace SaveCanvas
{
    #region Contexts
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    public partial class ImageDbEntities : ObjectContext
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new ImageDbEntities object using the connection string found in the 'ImageDbEntities' section of the application configuration file.
        /// </summary>
        public ImageDbEntities() : base("name=ImageDbEntities", "ImageDbEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new ImageDbEntities object.
        /// </summary>
        public ImageDbEntities(string connectionString) : base(connectionString, "ImageDbEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new ImageDbEntities object.
        /// </summary>
        public ImageDbEntities(EntityConnection connection) : base(connection, "ImageDbEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region Partial Methods
    
        partial void OnContextCreated();
    
        #endregion
    
        #region ObjectSet Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<Image> Images
        {
            get
            {
                if ((_Images == null))
                {
                    _Images = base.CreateObjectSet<Image>("Images");
                }
                return _Images;
            }
        }
        private ObjectSet<Image> _Images;

        #endregion

        #region AddTo Methods
    
        /// <summary>
        /// Deprecated Method for adding a new object to the Images EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToImages(Image image)
        {
            base.AddObject("Images", image);
        }

        #endregion

    }

    #endregion

    #region Entities
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="ImageDbModel", Name="Image")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Image : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new Image object.
        /// </summary>
        /// <param name="id">Initial value of the Id property.</param>
        public static Image CreateImage(global::System.Int32 id)
        {
            Image image = new Image();
            image.Id = id;
            return image;
        }

        #endregion

        #region Simple Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 Id
        {
            get
            {
                return _Id;
            }
            set
            {
                if (_Id != value)
                {
                    OnIdChanging(value);
                    ReportPropertyChanging("Id");
                    _Id = StructuralObject.SetValidValue(value, "Id");
                    ReportPropertyChanged("Id");
                    OnIdChanged();
                }
            }
        }
        private global::System.Int32 _Id;
        partial void OnIdChanging(global::System.Int32 value);
        partial void OnIdChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String ImageData
        {
            get
            {
                return _ImageData;
            }
            set
            {
                OnImageDataChanging(value);
                ReportPropertyChanging("ImageData");
                _ImageData = StructuralObject.SetValidValue(value, true, "ImageData");
                ReportPropertyChanged("ImageData");
                OnImageDataChanged();
            }
        }
        private global::System.String _ImageData;
        partial void OnImageDataChanging(global::System.String value);
        partial void OnImageDataChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public Nullable<global::System.DateTime> SaveDate
        {
            get
            {
                return _SaveDate;
            }
            set
            {
                OnSaveDateChanging(value);
                ReportPropertyChanging("SaveDate");
                _SaveDate = StructuralObject.SetValidValue(value, "SaveDate");
                ReportPropertyChanged("SaveDate");
                OnSaveDateChanged();
            }
        }
        private Nullable<global::System.DateTime> _SaveDate;
        partial void OnSaveDateChanging(Nullable<global::System.DateTime> value);
        partial void OnSaveDateChanged();

        #endregion

    }

    #endregion

}
